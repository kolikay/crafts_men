import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchSkillProvider extends ChangeNotifier {
  static final SearchSkillProvider _instance = SearchSkillProvider._();

  SearchSkillProvider._();

  static SearchSkillProvider get instance {
    return _instance;
  }

  final _firestore = FirebaseFirestore.instance;

  //Get Search Skills
  Future searchSkills(String search) async {
// Create a query against the collection.

    _firestore
        .collection("Skill Providers")
        .where("Skill", isGreaterThanOrEqualTo: search, isLessThan: search.substring(0, search.length-1) + String.fromCharCode(search.codeUnitAt(search.length - 1) + 1))
        .get()
        .then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }
}
