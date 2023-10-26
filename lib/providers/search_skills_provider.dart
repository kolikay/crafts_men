import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsmen/models/skillProvider_models.dart';
import 'package:flutter/material.dart';

class SearchSkillProvider extends ChangeNotifier {
  static final SearchSkillProvider _instance = SearchSkillProvider._();

  SearchSkillProvider._();

  static SearchSkillProvider get instance {
    return _instance;
  }

  final _firestore = FirebaseFirestore.instance;

  List<SkillProviderModel> allCraftmen = [];

  Future<List<SkillProviderModel>> getUser(String search) async {
    final snapshop = await _firestore
        .collection("Skill Providers")
        .where("Skill",
            isGreaterThanOrEqualTo: search,
            isLessThan: search.substring(0, search.length - 1) +
                String.fromCharCode(search.codeUnitAt(search.length - 1) + 1))
        .get();

    allCraftmen =
        snapshop.docs.map((e) => SkillProviderModel.fromSnapshot(e)).toList();

    for (var b in allCraftmen) {
      print(b.email);
    }
    return allCraftmen;
  }





  // Get Search Skills
  Future<List<SkillProviderModel>> searchSkills(String search) async {
    await _firestore
        .collection("Skill Providers")
        .where("Skill",
            isGreaterThanOrEqualTo: search,
            isLessThan: search.substring(0, search.length - 1) +
                String.fromCharCode(search.codeUnitAt(search.length - 1) + 1))
        .get()
        .then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data()}');

          SkillProviderModel merchant = SkillProviderModel.fromMap({
            'email': docSnapshot.data()["email"],
            'Full Name': docSnapshot.data()["Full Name"],
            'User Name': docSnapshot.data()["User Name"],
            'Phone Number': docSnapshot.data()["Phone Number"],
            'Gender': docSnapshot.data()["Gender"],
            'Address': docSnapshot.data()["Address"],
            'Reviews': docSnapshot.data()["Reviews"],
            'Profile Pic': docSnapshot.data()["Profile Pic"],
            'User Type': docSnapshot.data()["User Type"],
            'Company Address': docSnapshot.data()["Company Address"],
            'Company Name': docSnapshot.data()["Company Name"],
            'Company Email': docSnapshot.data()["Company Email"],
            'Company Website': docSnapshot.data()["Company Website"],
            'Company Phone Number': docSnapshot.data()["Company Phone Number"],
            'Skill': docSnapshot.data()["Skill"],
            'Experince': docSnapshot.data()["Experince"],
            'Employees': docSnapshot.data()["Employees"],
            'Company Start Year': docSnapshot.data()["Company Start Year"],
            'More About the Company':
                docSnapshot.data()["More About the Company"],
          });
          allCraftmen.add(merchant);
          notifyListeners();
          for (var email in allCraftmen) {
            print(email.email);
          }

          return allCraftmen;
        }
      },
      onError: (e) {
        print(e.toString());
        return [];
      },
    );
    return allCraftmen;
  }
}
