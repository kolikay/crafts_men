// import 'dart:io';

import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusable_info_widget.dart';
import 'package:craftsmen/constants/utils/snack_bar.dart';
import 'package:craftsmen/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../views/login_screen.dart';
import 'package:craftsmen/services/web_service.dart';
import 'package:craftsmen/constants/const/status_codes.dart';
import 'package:craftsmen/constants/const/shared_preferences.dart';
import 'package:dio/dio.dart';

class AuthViewModel extends ChangeNotifier {
  Dio dio = Dio();

  final userPref = UserPreferences();

  static final AuthViewModel _instance = AuthViewModel._();

  AuthViewModel._();

  // firebase ref
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  static AuthViewModel get instance {
    return _instance;
  }

  bool _loading = false;
  bool get loading => _loading;

  bool _userState = false;
  bool get userState => _userState;

  bool _loginError = false;

  bool get loginError => _loginError;

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

  setUserState(bool userState) {
    _userState = userState;
    notifyListeners();
  }

  //fake api call
  Future request() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    setLoading(false);
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

//store user data
  addUserdata(UserModel newUser) {
    userApiData.fullname = newUser.fullname;
    userApiData.email = newUser.email;
    userApiData.username = newUser.username;
    userApiData.confirmed = newUser.confirmed;
    userData.add(newUser);

    // userApiData.dob = newUser.dob;
    // userApiData.occupation = newUser.occupation;
    // userApiData.photo = newUser.photo;
    // userApiData.about = newUser.about;
    // userApiData.interest = newUser.interest;
    // userApiData.gender = newUser.gender;
  }

//login funtions
  loginUser(url, Object body, context) async {
    setLoading(true);
    try {
      final response = await WebServices.sendPostRequest(url, body, context);

      if (response.code == 200 || response.code == 201) {
        // save login user token from api response

        userPref.setLoginUerToken(response.response!['access_token']);

        // get logged in user details
        // uncomment after test
        await getLoginUserData(context);

        Future.delayed(const Duration(milliseconds: 500), () {
          //navigate to onbording screen after 30 seconds
          // pushOnBoardingScreen(context);
        });

        setLoading(false);
        return true;
      } else if (response.code == 400) {
        setLoginError(true);
        setLoading(false);
        return false;
      } else {
        setLoading(false);
        return false;
      }

      // if (response is SocketException) {
      //   pushToNoInternetPage(context);
      //   setLoading(false);f
      // }
      // setLoading(false);
    } on HttpException catch (e) {
      setLoading(false);
      return e.message;
    }
  }

  //registration funtions
  registerUser(Object body, context) async {
    setLoading(true);
    final response = await WebServices.sendPostRequest(
        '$baseApi/account/register/', body, context);

    if (response is Success) {
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => ReuseableInfoWidget(
      //       bottonText: 'Confirm Email',
      //       onPressed: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (context) => const VerifyOtpScreen(),
      //           ),
      //         );
      //       },
      //       logo: 'lib/assets/verifyIcon.png',
      //       maintext: 'Congratulations',
      //       detailsText:
      //           'Your account has been successfully created. Kindly go to your email to verify your account. If you did not receive an email, you can resend one',
      //     ),
      //   ),
      // );

      // pushOnBoardingScreen(context);
      setLoading(false);
    }
    if (response is Failure) {
      setLoading(false);
    }
    if (response is SocketException) {
      // pushToNoInternetPage(context);
      setLoading(false);
    }
    setLoading(false);
  }

  // save user data function
  Future getLoginUserData(context) async {
    setLoading(true);

    var response = await WebServices.sendGetRequest(
        "$baseApi/account/user/current/", context);

    if (response.code == SUCCESS) {
      final result = response.response;

      addUserdata(UserModel.fromJson(result));

      notifyListeners();

      setLoading(false);
    } else {
      setLoading(false);
    }

    setLoading(false);
  }

  //login funtions
  // save user data function
  Future logOutUser(context) async {
    var response =
        await WebServices.sendDeleteRequest("$baseApi/account/logout", context);

    if (response.code == 200 || response.code == 401) {
      await UserPreferences.resetSharedPref();
      Navigator.of(context).pushNamedAndRemoveUntil(
          LoginScreen.id, (Route<dynamic> route) => false);
      return true;
    } else {
      ShowSnackBar.buildErrorSnackbar(
          context, response!.data.toString(), Colors.pink[100]!);
      return false;
    }
  }
}
