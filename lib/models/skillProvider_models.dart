import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SkillProviderModel extends ChangeNotifier {
  SkillProviderModel({
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

  static SkillProviderModel fromSnapshot(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;

    return SkillProviderModel(
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


  // body: loading
  //         ? Container(
  //             child: const Center(child: CircularProgressIndicator()),
  //           )
  //         : file != null?Container(child: Center(child: Image.memory(image),)) : Container(
  //           child: const Center(child: Text('Pick an Image')),
  //         ),
  //         floatingActionButton: FloatingActionButton(
  //           child: const Icon(
  //             Icons.image,
  //           ),
  //           onPressed: (){
  //             pickImage();
  //           }),
  //   );
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

