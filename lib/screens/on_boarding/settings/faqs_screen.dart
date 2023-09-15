// import 'package:flutter/material.dart';
// import 'package:scholars_padi/constants/appColor.dart';
// import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:scholars_padi/widgets/reusesable_widget/reusesable_appBar2.dart';
// // import 'dart:io';

// class FaqsScreen extends StatefulWidget {
//   const FaqsScreen({Key? key}) : super(key: key);

//   @override
//   State<FaqsScreen> createState() => _FaqsScreenState();
// }

// class _FaqsScreenState extends State<FaqsScreen> {
//    bool showAnswer1 = false;
//    bool showAnswer2 = false;
//    bool showAnswer3 = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(103.h),
//         child: ReusesableAppBar2(
//           appBarTitle: 'FAQs',
//           firstButton: IconButton(
//             icon: const Icon(Icons.arrow_back_ios),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//       ),
//       body: Container(
//         color: AppColor.darkContainer,
//         height: 800.h,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.w),
//           child: Column(
//             children: [
//               SizedBox(height: 24.h),
//               NormalText(
//                 text: 'Some Frequestly asked questions are:',
//                 fontWeight: FontWeight.w500,
//                 size: 16.sp,
//               ),
//               SizedBox(height: 24.h),
//               faqsCards('How do i get to read materials and\npast questions?',
//                   () {
//                 setState(() {
//                   showAnswer1 = !showAnswer1;
//                 });
//               }, showAnswer1),
//               Visibility(
//                 visible: showAnswer1,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 185, 195, 221),
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   height: 104.h,
//                   width: 327.w,
//                   child: Padding(
//                     padding: EdgeInsets.all(10.0.h),
//                     child: Text(
//                       'Once you click on material button, it will lead you to where you will eneter your faculty, followed by department, level, cause and then you will choose your preferred option',
//                       style: TextStyle(
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.w500,
//                           height: 1.5),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 24.h),
//                 faqsCards('How do i see the latest news on the\npage?',
//                   () {
//                 setState(() {
//                   showAnswer2 = !showAnswer2;
//                 });
//               }, showAnswer2),
//               SizedBox(height: 24.h),
//                 faqsCards('How can i make a schedule for my\nday to day activities?',
//                   () {
//                 setState(() {
//                   showAnswer3 = !showAnswer3;
//                 });
//               }, showAnswer3),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   faqsCards(String cardMessage, GestureTapCallback onPressed, bool showAnswer) {
//     return Container(
//       height: 65.h,
//       width: 327.w,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           border: Border.all(color: Colors.black12)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
//             child: NormalText(
//               text: cardMessage,
//               fontWeight: FontWeight.w400,
//               size: 14.sp,
//               color: Colors.black54,
//             ),
//           ),
//           IconButton(
//             onPressed: onPressed,
//             icon: Icon(
//               showAnswer ? Icons.arrow_drop_down : Icons.arrow_drop_up,
//               color: Colors.black54,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
