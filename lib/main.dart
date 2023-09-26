import 'package:craftsmen/constants/const/color.dart';

import 'package:craftsmen/screens/auth/views/sign_up_screen.dart';
import 'package:craftsmen/screens/change_password/email_password_change_screen.dart';
import 'package:craftsmen/screens/change_password/enter_newpassword_screen.dart';
import 'package:craftsmen/screens/change_password/passord_resetpin_screen.dart';
import 'package:craftsmen/screens/landing_page/landing_page_screen.dart';
import 'package:craftsmen/screens/landing_page/landing_page_screen2.dart';
import 'package:craftsmen/screens/location/location_screen.dart';
import 'package:craftsmen/screens/location/location_screen2.dart';
import 'package:craftsmen/screens/auth/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/on_boarding/craftsMen/details/craftsmen_fill_details_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCduRrB3MyvBbVA-woOBgZGJvxGZZbDA9E",
          projectId: "crafts-men-9d6e7",
          storageBucket: "crafts-men-9d6e7.appspot.com",
          messagingSenderId: "763376360027",
          appId: "1:763376360027:web:5d4dc252560856c641bd7e"));
  // run app
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Craftsmen',
          theme: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: kMainColor,
                ),
          ),
          home: const CraftmenFillDetailsScreen(),
          routes: {
            LandingPage2.id: (context) => const LandingPage2(),
            SignUpScreen.id: (context) => const SignUpScreen(),
            LoginScreen.id: (context) => const LoginScreen(),
            EmailPasswordChangeScreen.id: (context) =>
                const EmailPasswordChangeScreen(),
            PasswordResetPinScreen.id: (context) =>
                const PasswordResetPinScreen(),
            NewPasswordScreen.id: (context) => const NewPasswordScreen(),
            LocationScreen2.id: (context) => const LocationScreen2(),
            LocationScreen.id: (context) => const LocationScreen(),
          
          },
        );
      },
    );
  }
}
