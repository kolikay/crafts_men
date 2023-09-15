import 'package:craftsmen/constants/const/color.dart';
import 'package:flutter/material.dart';
import 'home_screens/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';





class OnBoardingScreen extends StatefulWidget {
  static String id = 'onBordingScreen';
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // static const String id = 'onBoard';

  int currentIndex = 0;

  final screens = [
    const HomePageScreen(),
    const HomePageScreen(),
    const HomePageScreen(),
     const HomePageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25.0.w,
        backgroundColor: Colors.white70,
        selectedItemColor: kMainColor,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => currentIndex = index),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
