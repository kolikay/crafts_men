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

  Future<List<SkillProviderModel>> searchSkills(String search) async {
    final snapshop = await _firestore
        .collection("Skill Providers")
        .where("Skill",
            isGreaterThanOrEqualTo: search.toLowerCase(),
            isLessThan: search.toLowerCase().substring(0, search.length - 1) +
                String.fromCharCode(search
                        .toLowerCase()
                        .codeUnitAt(search.toLowerCase().length - 1) +
                    1))
        .get();

    allCraftmen =
        snapshop.docs.map((e) => SkillProviderModel.fromSnapshot(e)).toList();

    // for (var b in allCraftmen) {
    //   print(b.email);
    // }
    return allCraftmen;
  }
}
