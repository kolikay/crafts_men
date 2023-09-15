// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:scholars_padi/constants/appColor.dart';
// import 'package:scholars_padi/routes/page_routes.dart';

// class AboutUsScreen extends StatelessWidget {
//   const AboutUsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: 50.h,
//           ),
//           Stack(
//             children: [
//               SizedBox(
//                 height: 130.h,
//                 child: Center(
//                   child: SizedBox(
//                     height: 125.h,
//                     width: 121.21.w,
//                     child: Image.asset(
//                       'lib/assets/logo.png',
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: -10,
//                 left: 35,
//                 child: IconButton(
//                   onPressed: () {
//                     pushOnBoardingScreen(context);
//                   },
//                   icon: const Icon(
//                     Icons.close,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 24.h,
//           ),
//           const Divider(
//             color: AppColor.dullBlack,
//             thickness: 0.9,
//           ),
//           SizedBox(
//             height: 15.h,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     children: <TextSpan>[
//                       TextSpan(
//                           text: 'Welcome to ',
//                           style: TextStyle(
//                               fontSize: 18.sp, fontWeight: FontWeight.bold)),
//                       TextSpan(
//                         text: 'Scholars Padi',
//                         style: TextStyle(
//                             fontSize: 18.sp,
//                             color: AppColor.mainColor,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                     children: <TextSpan>[
//                       TextSpan(
//                         text: 'Scholars Padi',
//                         style: TextStyle(
//                             fontSize: 14.sp,
//                             color: AppColor.mainColor,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       TextSpan(
//                         text:
//                             ' is the largest educational platform on the campus where students get access to all departments materials/textbooks and other necessary information.',
//                         style: TextStyle(
//                             height: 2.h,
//                             fontSize: 14.sp,
//                             color: AppColor.dullBlack,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
