// import 'dart:io';

import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsmen/models/models.dart';
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

  // empty list to save user data from api
  List<UserModel> userData = [];

  //Log in User
  UserModel? _user;
  UserModel getUser() => _user!;

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
  Future<String> signUpUser({
    required Map <String, dynamic> body,
    required String password,
    required String email,

    // required Uint8List file,
  }) async {
    setLoading(true);
    try {
      if (body.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        _firestore.collection('Users').doc(credential.user!.uid).set(body);
      }

      // Future<String> signUpUser({
      //   required String email,
      //   required String fullname,
      //   required String username,
      //   required String phoneNumber,
      //   required String address,
      //   required String password,
      //   required String gender,
      //   // required Uint8List file,
      // }) async {
      //   setLoading(true);
      //   try {
      //     if (email.isNotEmpty ||
      //         fullname.isNotEmpty ||
      //         username.isNotEmpty ||
      //         phoneNumber.isNotEmpty ||
      //         address.isNotEmpty ||
      //         password.isNotEmpty ||
      //         gender.isNotEmpty) {
      //       UserCredential credential = await _auth.createUserWithEmailAndPassword(
      //           email: email, password: password);

      //       _firestore.collection('Users').doc(credential.user!.uid).set(
      //         {
      //         "id": credential.user!.uid,
      //         "email": email,
      //         "Full Name": fullname,
      //         "User Name": username,
      //         "Phone Number": phoneNumber,
      //         "Gender": '',
      //         "address": address,
      //         'reviews': []
      //       });
      //     }

      //get login user details upon sign up
      await getLoggedinUserDetails();
      setLoading(false);
      return 'Success';
    } catch (e) {
      setLoading(false);

      return e.toString();
    }
  }

  //Get Loggen In User Details
  Future<UserModel?> getLoggedinUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('Users').doc(currentUser.uid).get();

    _user = UserModel.fromSnapshot(snap);
    notifyListeners();

    return _user;
  }
}
