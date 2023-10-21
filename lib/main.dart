import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/const/shared_preferences.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/screens/auth/auth_view_models/auth_view_model.dart';

import 'package:craftsmen/screens/auth/views/sign_up_screen.dart';
import 'package:craftsmen/screens/change_password/email_password_change_screen.dart';
import 'package:craftsmen/screens/landing_page/landing_page_screen.dart';
import 'package:craftsmen/screens/landing_page/landing_page_screen2.dart';
import 'package:craftsmen/screens/location/location_screen.dart';
import 'package:craftsmen/screens/location/location_screen2.dart';
import 'package:craftsmen/screens/auth/views/login_screen.dart';
import 'package:craftsmen/screens/on_boarding/on_boarding_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();

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
    String? userType = UserPreferences.getUserType();

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
          home: 
          // LandingPage(),
              StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return OnBoardingScreen(
                    user: userType,
                  );
                } else if (snapshot.hasError) {
                  return Center(
                      child: NormalText(
                    text: 'Error Occured',
                  ));
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: kMainColor),
                );
              }
              return const LandingPage();
            }),
          ),
          routes: {
            LandingPage.id: (context) => const LandingPage(),
            LandingPage2.id: (context) => LandingPage2(),
            SignUpScreen.id: (context) => SignUpScreen(),
            LoginScreen.id: (context) => const LoginScreen(),
            EmailPasswordChangeScreen.id: (context) =>
                const EmailPasswordChangeScreen(),
            // PasswordResetPinScreen.id: (context) =>
            //     PasswordResetPinScreen(),

            LocationScreen2.id: (context) => const LocationScreen2(),
            LocationScreen.id: (context) => const LocationScreen(),
            OnBoardingScreen.id: (context) => OnBoardingScreen(
                  user: userType,
                ),
          },
        );
      },
    );
  }
}
