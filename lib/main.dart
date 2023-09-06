import 'package:craftsmen/screens/landing_page/landing_page_screen2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/landing_page/landing_page_screen.dart';
import 'screens/landing_page/landing_page_screen2.dart';

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
  runApp(
    const MyApp(),
  );
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
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LandingPage(),
          routes: {
            LandingPage2.id: (context) => LandingPage2(),
            // CatergoriesSearchScreen.id: (context) => const CatergoriesSearchScreen(),
            // CategoriesPage.id: (context) => const CategoriesPage(),
            //  OnBoardingScreen.id: (context) => const OnBoardingScreen(),
            //  LoginScreen.id: (context) => const LoginScreen(),
            //  SettingsScreen.id: ((context) => const SettingsScreen()),
            //  ProfileScreen.id: ((context) => const ProfileScreen())
          },
        );
      },
    );
  }
}
