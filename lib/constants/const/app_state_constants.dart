// ignore_for_file: non_constant_identifier_names





import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../screens/auth/auth_view_models/auth_view_model.dart';

const baseApi = 'https://scholarspadi.com/api';

final authViewModelProvider = ChangeNotifierProvider<AuthViewModel>((ref) {
  return AuthViewModel.instance;
});






// final profileViewModelProvider =
//     ChangeNotifierProvider<ProfileModelView>((ref) {
//   return ProfileModelView();
// });




// // Update state and notify Notification screen app bar
// final notificationProvider = ChangeNotifierProvider<NotificationViewModel>((ref) {
//   return NotificationViewModel();
// });


