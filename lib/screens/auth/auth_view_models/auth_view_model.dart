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

  bool _otp = false;
  bool get otp => _otp;

  bool _otpValidated = false;
  bool get otpValidated => _otpValidated;

  // firebase ref
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  // AuthHandler authHandler = AuthHandler();

  AuthHandler authHandler = AuthHandler();

  // empty list to save user data from api
  List<UserModel> userData = [];

//instance of usermodel
  UserModel userApiData = UserModel();

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setLoginError(bool loginError) {
    _loginError = loginError;
    notifyListeners();
  }

  setOtp(bool otp) async {
    _otp = otp;
    notifyListeners();
  }

  setValidatedOtp(bool validatedOtp) async {
    _otpValidated = otpValidated;
    notifyListeners();
  }

  Future request() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    setLoading(false);
  }

  //sent OTP for email validation
  void sendOtp(String email) async {
    setLoading(true);
    authHandler.config(
      senderEmail: "noreply@craftmen.dev",
      senderName: "Crafts Men",
      otpLength: 4,
    );

    bool result = await authHandler.sendOtp(email);
    if (result) {
      setOtp(true);
    } else {
      setOtp(false);
    }
    setLoading(false);
  }

//email validation
  Future<bool> verify(String userOtp) async {
    setLoading(true);
    
    var validated = await authHandler.verifyOtp(userOtp);

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
    required String email,
    required String fullname,
    required String username,
    required String phoneNumber,
    required String address,
    required String password,
    required String gender,
    // required Uint8List file,
  }) async {
    setLoading(true);
    try {
      if (email.isNotEmpty ||
          fullname.isNotEmpty ||
          username.isNotEmpty ||
          phoneNumber.isNotEmpty ||
          address.isNotEmpty ||
          password.isNotEmpty ||
          gender.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        _firestore.collection('Users').doc(credential.user!.uid).set({
          "username": username,
          "fullname": fullname,
          "phone": phoneNumber,
          "address": address,
          "id": credential.user!.uid,
          'reviews': []
        });
      }

      setLoading(false);
      return 'Success';
    } catch (e) {
      setLoading(false);

      return e.toString();
    }
  }
}
