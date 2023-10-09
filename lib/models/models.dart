import 'package:cloud_firestore/cloud_firestore.dart';
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
    this.reviews
  });

  String? id;
  String? email;
  String? fullName;
  String? userName;
  String? phoneNumber;
  String? gender;
  String? address;
  List? reviews;

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
      reviews: [],
    );
  }
}

  // factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
  //       id: json["_id"],
  //       email: json["email"],
  //       fullName: json["Full Name"],
  //       userName: json["User Name"],
  //       phoneNumber: json["Phone Number"],
  //       gender: json["Gender"],
  //       address: json["Address"],
        // active: json["active"],
        // about: json["about"],
        // gender: json["gender"],
        // interest: json["interest"],
        // location: json["location"],
        // name: json["name"],
        // occupation: json["occupation"],
        // surname: json["surname"],
        // photo: json["photo"],
        // dob: json["dob"],
      // );

  // Map<String, dynamic> toJson() => {
  //       "_id": id,
  //       "email": email,
  //       "Full Name": fullName,
  //       "User Name": userName,
  //       "Phone Number": phoneNumber,
  //       "Gender": gender,
  //       "Address": address,
  //     };

