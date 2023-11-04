import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsmen/models/skillProvider_models.dart';
import 'package:craftsmen/models/user_models.dart';
import 'package:craftsmen/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';

class SearchSkillProvider extends ChangeNotifier {
  static final SearchSkillProvider _instance = SearchSkillProvider._();

  SearchSkillProvider._();

  static SearchSkillProvider get instance {
    return _instance;
  }

  final _firestore = FirebaseFirestore.instance;
  final geo = Geoflutterfire();

  List<SkillProviderModel> allCraftmen = [];

  List<SkillProviderModel> allLocationCraftmen = [];

  Future<List<SkillProviderModel>> searchSkills(String search) async {
    final snapshop = await _firestore
        .collection("Skill Providers")
        .where("Skill",
            isGreaterThanOrEqualTo: search.toLowerCase(),
            isLessThan: search.toLowerCase().substring(0, search.length - 1) +
                String.fromCharCode(search
                        .toLowerCase()
                        .codeUnitAt(search.toLowerCase().length - 1) +
                    1)).get();
    allCraftmen =
        snapshop.docs.map((e) => SkillProviderModel.fromSnapshot(e)).toList();
    return allCraftmen;
  }


  Stream<List<DocumentSnapshot>> searchLocations(String search) {
    GeoFirePoint center = geo.point(latitude: 9.0701855, longitude: 7.4870448);
    var collectionReference = _firestore
        .collection('Skill Providers')
        .where(search.toLowerCase().trim(), isEqualTo: 'Skill');

    Stream<List<DocumentSnapshot>> stream = geo
        .collection(collectionRef: collectionReference)
        .within(center: center, radius: 50, field: 'position');

    return stream;
  }
}
