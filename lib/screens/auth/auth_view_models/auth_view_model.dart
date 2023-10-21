// import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsmen/models/skillProvider_models.dart';
import 'package:craftsmen/models/user_models.dart';
import 'package:craftsmen/providers/skill_provider.dart';
import 'package:craftsmen/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:craftsmen/constants/const/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:auth_handler/auth_handler.dart';

class AuthViewModel extends ChangeNotifier {
  Dio dio = Dio();

  final userPref = UserPreferences();

  static final AuthViewModel _instance = AuthViewModel._();

  AuthViewModel._();

  static AuthViewModel get instance {
    return _instance;
  }

  bool _loading = false;
  bool get loading => _loading;

  bool _loginError = false;
  bool get loginError => _loginError;

  // firebase ref
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  AuthHandler authHandler = AuthHandler();

  UserModel? _user;
  UserModel userApiData = UserModel();
  UserModel get getUser => _user!;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setLoginError(bool loginError) {
    _loginError = loginError;
    notifyListeners();
  }

  Future request() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    setLoading(false);
  }

  //sent OTP for email validation
  Future<bool> sendOtp(String email) async {
    setLoading(true);
    authHandler.config(
      senderEmail: "noreply@craftmen.dev",
      senderName: "Crafts Men",
      otpLength: 4,
    );

    bool result = await authHandler.sendOtp(email);
    if (result) {
      setLoading(false);
      return true;
    } else {
      setLoading(false);
      return false;
    }
  }

//email validation
  Future<bool> verify(String userOtp) async {
    setLoading(true);
    bool validated = await authHandler.verifyOtp(userOtp);
    if (validated == true) {
      setLoading(false);
      return true;
    } else {
      setLoading(false);
      return false;
    }
  }

// User Registration
  Future<String?> signUpUser({
    required Map<String, dynamic> body,
    required String password,
    required String email,
    required String userType,
  }) async {
    setLoading(true);
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // do whatever you want to do with new user object
      _firestore.collection(userType).doc(_auth.currentUser!.uid).set(body);
      setLoading(false);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      return e.toString();
    }
  }

// User Login
  Future<String> signIn(
      {required String password, required String email}) async {
    String? response;
    setLoading(true);

    if (password.isNotEmpty || email.isNotEmpty) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        final userDoc = await _firestore
            .collection('Users')
            .doc(_auth.currentUser!.uid)
            .get();

        if (userDoc.exists) {
          print('one');
          //get login user details upon sign up
          UserModel data = await UserProvider.instance.getLoggedinUserDetails();

          response = data.userType;

          userPref.setUserType('Users');
          setLoading(false);
        } else {
           print('two');
          //get login user details upon sign up
          SkillProviderModel data =
              await SkillProvider.instance.getLoggedinUserDetails();

          response = data.userType;

          userPref.setUserType('Skill Providers');

          setLoading(false);
        }
      }).catchError((e) async {
        print(e.toString());
        await _auth.signOut();
        response = 'Login Failed';
        setLoginError(true);
        setLoading(false);
      });
    }
    return response!;
  }

  Future logOut() async {
    setLoading(true);
    await UserPreferences.resetSharedPref();
    await _auth.signOut();

    setLoading(false);
  }
}
