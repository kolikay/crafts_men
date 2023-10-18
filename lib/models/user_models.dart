import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  UserModel({
    this.id,
    this.email,
    this.fullName,
    this.userName,
    this.phoneNumber,
    this.gender,
    this.address,
    this.reviews,
    this.profilePic,
    this.userType,
  });

  String? id;
  String? email;
  String? fullName;
  String? userName;
  String? phoneNumber;
  String? gender;
  String? address;
  String? profilePic;
  List? reviews;
  String? userType;


    UserModel.fromFirebaseUser({User? user}) {
    id = user!.uid;
    email = user.email;
    userName = user.displayName;
  }

  static UserModel fromSnapshot(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;

    return UserModel(
      id: snapShot["ID"],
      email: snapShot["email"],
      fullName: snapShot["Full Name"],
      userName: snapShot["User Name"],
      phoneNumber: snapShot["Phone Number"],
      gender: snapShot["Gender"],
      address: snapShot["Address"],
      reviews: ["Reviews"],
      profilePic: snapShot["Profile Pic"],
       userType: snapShot["User Type"],
    );
  }
}


// class AuthUser {
//   String? uid;
//   String? email;
//   String? userName;

//   AuthUser({
//     required this.uid,
//     required this.email,
//     required this.userName,
//   });

//   AuthUser.fromFirebaseUser({User? user}) {
//     uid = user!.uid;
//     email = user.email;
//     userName = user.displayName;
//   }
// }