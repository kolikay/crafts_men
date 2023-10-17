// ignore_for_file: non_constant_identifier_names


import 'package:craftsmen/models/user_models.dart';
import 'package:craftsmen/providers/skill_provider.dart';
import 'package:craftsmen/providers/user_provider.dart';
import 'package:craftsmen/screens/auth/auth_view_models/auth_view_model.dart';
import 'package:craftsmen/screens/on_boarding/user/profile_screens/profile_view_model/profile_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const baseApi = 'https://scholarspadi.com/api';

final authViewModelProvider = ChangeNotifierProvider<AuthViewModel>((ref) {
  return AuthViewModel.instance;
});

// final profileViewModelProvider =
//     ChangeNotifierProvider<ProfileModelView>((ref) {
//   return ProfileModelView();
// });



//provider for logged in user api data
final userProvider = ChangeNotifierProvider<UserProvider>((ref) {
  return UserProvider.instance;
});

//provider for logged in user api data
final skillProvider = ChangeNotifierProvider<SkillProvider>((ref) {
  return SkillProvider.instance;
});





// // Update state and notify Notification screen app bar
// final notificationProvider = ChangeNotifierProvider<NotificationViewModel>((ref) {
//   return NotificationViewModel();
// });


