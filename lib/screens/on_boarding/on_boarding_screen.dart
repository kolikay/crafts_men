import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/screens/on_boarding/user/notifications/views/notification_screen1.dart';

import 'package:craftsmen/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'user/bookings/bookings.dart';
import 'user/home_screens/home_page.dart';

class OnBoardingScreen extends StatefulWidget {
  // final String? user;
  static String id = 'onBordingScreen';

  const OnBoardingScreen({Key? key,
  // required this.user
  
  }) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;

  final userScreens = [
    const HomePageScreen(),
    const Bookings(),
    const NotificationScreen1(),
    const SettingsScreen()
  ];

  final userOnboardingIcons = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark_add),
      label: 'Bookings',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: 'Notification',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Accounts',
    ),
  ];

  final skillScreens = const [
    Bookings(),
    HomePageScreen(),
    HomePageScreen(),
    SettingsScreen()
  ];

  final skillIcons = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark_add),
      label: 'Bookings',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.reviews_outlined),
      label: 'Reviews',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat),
      label: 'Chats',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Accounts',
    ),
  ];

  final bothScreens = const [
    HomePageScreen(),
    HomePageScreen(),
    HomePageScreen(),
    HomePageScreen(),
    Bookings(),
  ];

  final bothIcons = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'bome',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Rome',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Dome',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark_add),
      label: 'Bookings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<StatefulWidget> showScreen = [];
    List<BottomNavigationBarItem> onboardingIcons = [];

    // switch (widget.user) {
    //   case 'kola':
    //     setState(() {
    //       showScreen = skillScreens;
    //       onboardingIcons = skillIcons;
    //     });
    //     break;
    //   case 'ayo':
    //     setState(() {
    //       showScreen = userScreens;
    //       onboardingIcons = userOnboardingIcons;
    //     });
    //     break;

    //   default:
    //     setState(() {
    //       showScreen = bothScreens;
    //       onboardingIcons = bothIcons;
    //     });
    // }
    return Scaffold(
      // body: showScreen[currentIndex],
      body: userScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 25.0.w,
          backgroundColor: Colors.white70,
          selectedItemColor: kMainColor,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(() => currentIndex = index),
          currentIndex: currentIndex,
          // items: onboardingIcons
          items: userOnboardingIcons,
          
          ),
    );
  }
}
