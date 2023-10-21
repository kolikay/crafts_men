import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsmen/models/user_models.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';



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

    UserModel user = UserModel.fromSnapshot(
      snap,
    );
    userApiData.fullName = user.fullName;
    userApiData.email = user.email;
    userApiData.userName = user.userName;
    userApiData.gender = user.gender;
    userApiData.address = user.address;
    userApiData.phoneNumber = user.phoneNumber;
    userApiData.reviews = user.reviews;
    userApiData.profilePic = user.profilePic;
    notifyListeners();
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
//   List<UserModel> _userDataFromSnapshop(QuerySnapshot snapShot) {
//     return snapShot.docs.map((doc) {
//       return UserModel(
//         id: doc.get("ID") ?? '',
//         email: doc.get("email") ?? '',
//         fullName: doc.get("Full Name") ?? '',
//         userName: doc.get("User Name") ?? '',
//         phoneNumber: doc.get("Phone Number") ?? '',
//         gender: doc.get("Gendere") ?? '',
//         address: doc.get("Address") ?? '',
//         reviews: doc.get("Reviews") ?? '',
//         profilePic: doc.get("Profile Pic") ?? '',
//         userType: doc.get("User Type") ?? '',
//       );
//     }).toList();
//   }

//   static UserModel fromSnapshot(DocumentSnapshot snap) {
//     var snapShot = snap.data() as Map<String, dynamic>;

//     return UserModel(
//       id: snapShot["ID"],
//       email: snapShot["email"],
//       fullName: snapShot["Full Name"],
//       userName: snapShot["User Name"],
//       phoneNumber: snapShot["Phone Number"],
//       gender: snapShot["Gender"],
//       address: snapShot["Address"],
//       reviews: ["Reviews"],
//       profilePic: snapShot["Profile Pic"],
//       userType: snapShot["User Type"],
//     );
//   }

//   Stream<List<UserModel>> get userDataStream {
//     return _firestore.collection('User').snapshots().map(_userDataFromSnapshop);
//   }

//   Stream<UserModel> get userDataStream1 {
//     return _firestore
//         .collection('User')
//         .doc(_auth.currentUser!.uid)
//         .snapshots()
//         .map(fromSnapshot);
//   }
// }
