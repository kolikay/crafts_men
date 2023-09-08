// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';


import 'package:flutter/cupertino.dart';

UserModel userDataModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String userDataModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel  extends ChangeNotifier{
  UserModel({
    this.id,
    this.email,
    this.username,
    this.fullname,
    this.confirmed,
    // this.active,
    // this.about,
    // this.gender,
    // this.interest,
    // this.location,
    // this.name,
    // this.occupation,
    // this.surname,
    // this.photo,
    // this.dob,
  });

  String? id;
  String? email;
  String? username;
  String? fullname;
  bool? confirmed;
  // bool? active;
  // String? about;
  // String? gender;
  // String? interest;
  // String? location;
  // String? name;
  // String? occupation;
  // String? surname;
  // String? photo;
  // String? dob;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        email: json["email"],
        username: json["username"],
        fullname: json["full_name"],
        confirmed: json["confirmed"],
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
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "username": username,
        "full_name": fullname,
        "confirmed": confirmed,
        // "active": active,
        // "about": about,
        // "gender": gender,
        // "interest": interest,
        // "location": location,
        // "name": name,
        // "occupation": occupation,
        // "surname": surname,
        // "photo": photo,
        // "dob": dob,
      };
}
