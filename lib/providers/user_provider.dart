import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsmen/models/models.dart';
import 'package:craftsmen/screens/auth/auth_view_models/auth_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProvider extends ChangeNotifier {
  static final UserProvider _instance = UserProvider._();

  UserProvider._();

  static UserProvider get instance {
    return _instance;
  }

  File? image;
  // firebase ref
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  //instance of usermodel
  UserModel userApiData = UserModel();

  //Get Loggen In User Details
  Future getLoggedinUserDetails() async {
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
  }


  // Update Login User Details
  Future updateLoggedinUserDetails(Map<String, dynamic> body) async {
    AuthViewModel.instance.setLoading(true);
    User currentUser = _auth.currentUser!;
    await _firestore.collection('Users').doc(currentUser.uid).update(body);
    await getLoggedinUserDetails();
    AuthViewModel.instance.setLoading(false);
  }


  Future pickImage(ImageSource source) async {
    try {
      final _image = await ImagePicker().pickImage(source: source);
      if (_image == null) return;
      final _imageTem = File(_image.path);
      image = _imageTem;
      notifyListeners();
    } catch (e) {
      // print('failed to pick image: $e');
    }
  }
}
