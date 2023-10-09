import 'package:craftsmen/models/models.dart';
import 'package:craftsmen/screens/auth/auth_view_models/auth_view_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final _authMethods = AuthViewModel.instance;
  UserModel? _user;

  UserModel get getUser => _user!;

  //instance of usermodel
  UserModel userApiData = UserModel();

  Future<void> refreshUser() async {
    UserModel? user = await _authMethods.getLoggedinUserDetails();
    _user = user;
    addUserdata(user!);
    notifyListeners();
  }

  Future addUserdata(UserModel user) async {
    userApiData.fullName = user.fullName;
    userApiData.email = user.email;
    userApiData.userName = user.userName;
 
  }
}
