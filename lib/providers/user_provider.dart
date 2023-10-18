import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsmen/models/user_models.dart';
import 'package:craftsmen/screens/auth/auth_view_models/auth_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProvider extends ChangeNotifier {
  static final UserProvider _instance = UserProvider._();

  UserProvider._();

  static UserProvider get instance {
    return _instance;
  }

  // firebase ref
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  //instance of usermodel
  UserModel userApiData = UserModel();

  //Get Loggen In User Details
  Future<UserModel> getLoggedinUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('Users').doc(currentUser.uid).get();

    UserModel user = UserModel.fromSnapshot(snap);
    userApiData.fullName = user.fullName;
    userApiData.email = user.email;
    userApiData.userName = user.userName;
    userApiData.gender = user.gender;
    userApiData.address = user.address;
    userApiData.phoneNumber = user.phoneNumber;
    userApiData.reviews = user.reviews;
    userApiData.profilePic = user.profilePic;

    return user;
  }

  // Update Login User Details
  Future updateLoggedinUserDetails(Map<String, dynamic> body) async {
    User currentUser = _auth.currentUser!;
    await _firestore.collection('Users').doc(currentUser.uid).update(body);
    await getLoggedinUserDetails();
  }

  Future<String?> updateUserPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }
  }
}
