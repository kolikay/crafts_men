// import 'package:flutter/material.dart';
// import 'package:scholars_padi/constants/appColor.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:scholars_padi/screens/on_boarding/home_screens/homepage_constant_widgets.dart';
// import 'package:scholars_padi/screens/on_boarding/profile_screens/profile_view/profile_screen.dart';
// import 'package:scholars_padi/screens/on_boarding/settings/about_us_screen.dart';
// import 'package:scholars_padi/screens/on_boarding/settings/contact_screen.dart';
// import 'package:scholars_padi/screens/on_boarding/settings/faqs_screen.dart';
// import 'package:scholars_padi/screens/on_boarding/settings/feed_back_screen.dart';
// import 'package:scholars_padi/screens/on_boarding/settings/log_out_screen.dart';
// import 'package:scholars_padi/screens/on_boarding/settings/notification_screen.dart';
// import 'package:scholars_padi/screens/on_boarding/settings/rate_us_screen.dart';
// import 'package:scholars_padi/screens/on_boarding/settings/themes._settings.dart';
// import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({Key? key}) : super(key: key);
//   static const String id = 'settings_screen';

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(225.h),
//         child: AppBar(
//           automaticallyImplyLeading: false,
//           title: Padding(
//             padding: EdgeInsets.only(
//               top: 10.0.h,
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: Icon(Icons.arrow_back_ios, size: 18.w),
//                     ),
//                     NormalText(
//                       text: 'Settings',
//                       fontWeight: FontWeight.w500,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 16.h,
//                 ),
//                 Container(
//                   height: 70.h,
//                   width: 70.w,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: AssetImage(
//                         'lib/assets/homepageimage.png',
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 8.h,
//                 ),
//                 NormalText(
//                   text: 'Kolawole Johnson',
//                   size: 19.2.sp,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white,
//                 )
//               ],
//             ),
//           ),
//           toolbarHeight: 225.h,
//           backgroundColor: AppColor.mainColor,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           color: AppColor.darkContainer,
//           height: 821.h,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 12.h,
//               ),
//               //homepage constant icons borrowed
//               DrawerIcons(
//                 onPressed: () {
//                   Navigator.pushNamed(context, ProfileScreen.id);
//                 },
//                 icon: Icons.person,
//                 iconColor: Colors.black54,
//                 imageName: 'Edit Profile',
//               ),
//               SizedBox(
//                 height: 15.h,
//               ),
//               DrawerIcons(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: ((context) => const NotificationScreen()),
//                     ),
//                   );
//                 },
//                 icon: Icons.notifications,
//                 iconColor: Colors.black54,
//                 imageName: 'Notifications',
//               ),
//               SizedBox(
//                 height: 15.h,
//               ),
//               DrawerIcons(
//                 onPressed: () {
//                   showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return const ThemesSettingScreen();
//                       });
//                 },
//                 icon: Icons.contrast_outlined,
//                 iconColor: Colors.black54,
//                 imageName: 'Themes',
//               ),
//               SizedBox(
//                 height: 15.h,
//               ),
//               SizedBox(
//                 height: 15.h,
//               ),
//               DrawerIcons(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: ((context) => const ContactScreen()),
//                     ),
//                   );
//                 },
//                 icon: Icons.phone,
//                 iconColor: Colors.black54,
//                 imageName: 'Contact Us',
//               ),
//               SizedBox(
//                 height: 15.h,
//               ),
//               DrawerIcons(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: ((context) => const AboutUsScreen()),
//                     ),
//                   );
//                 },
//                 icon: Icons.error_outline,
//                 iconColor: Colors.black54,
//                 imageName: 'About App',
//               ),
//               SizedBox(
//                 height: 15.h,
//               ),
//               DrawerIcons(
//                 icon: Icons.share,
//                 iconColor: Colors.black54,
//                 imageName: 'Share',
//               ),
//               SizedBox(
//                 height: 15.h,
//               ),
//               DrawerIcons(
//                 onPressed: () {
//                   showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return const RateUsScreen();
//                       });
//                 },
//                 icon: Icons.star_rate,
//                 iconColor: Colors.black54,
//                 imageName: 'Rate Us',
//               ),
//               SizedBox(
//                 height: 15.h,
//               ),
//               DrawerIcons(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: ((context) => const FaqsScreen()),
//                     ),
//                   );
//                 },
//                 icon: Icons.question_mark_sharp,
//                 iconColor: Colors.black54,
//                 imageName: 'FAQs',
//               ),
//               SizedBox(
//                 height: 15.h,
//               ),
//               DrawerIcons(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: ((context) => const FeedBackScreen()),
//                     ),
//                   );
//                 },
//                 icon: Icons.feedback_rounded,
//                 iconColor: Colors.black54,
//                 imageName: 'FeedBack',
//               ),
//               SizedBox(
//                 height: 15.h,
//               ),
//               DrawerIcons(
//                 onPressed: () {
//                   showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return const LogOutScreen();
//                       });
//                 },
//                 icon: Icons.logout,
//                 iconColor: Colors.black54,
//                 imageName: 'Logout',
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
