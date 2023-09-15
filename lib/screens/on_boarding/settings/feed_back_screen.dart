// import 'package:flutter/material.dart';
// import 'package:scholars_padi/constants/appColor.dart';
// import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:scholars_padi/widgets/reusesable_widget/reuseable_button.dart';
// import 'package:scholars_padi/widgets/reusesable_widget/reusesable_appBar2.dart';

// class FeedBackScreen extends StatefulWidget {
//   const FeedBackScreen({Key? key}) : super(key: key);

//   @override
//   State<FeedBackScreen> createState() => _FeedBackScreenState();
// }

// class _FeedBackScreenState extends State<FeedBackScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(103.h),
//         child: ReusesableAppBar2(
//           appBarTitle: 'Feedback',
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
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 24.h,
//               ),
//               NormalText(
//                 text:
//                     'Have Feedback? We would love to hear it, but please don\'t share sensitive information.',
//                 fontWeight: FontWeight.w500,
//                 size: 16,
//                 color: AppColor.dullBlack,
//               ),
//               TextButton(
//                 onPressed: () {},
//                 child: RichText(
//                   text: TextSpan(
//                     children: <TextSpan>[
//                       TextSpan(
//                           text: 'For technical support,please ',
//                           style: TextStyle(
//                               fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColor.dullBlack)),
//                       TextSpan(
//                         text: 'Contact Us',
//                         style: TextStyle(
//                             fontSize: 16.sp,
//                             color: AppColor.mainColor,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               NormalText(
//                 text: 'Please enter your feedback here',
//                 fontWeight: FontWeight.w500,
//                 size: 16,
//                 color: AppColor.dullBlack,
//               ),
//               SizedBox(
//                 height: 24.h,
//               ),
//               SizedBox(
//                 height: 300.h,
//                 child: TextField(
//                   textAlignVertical: TextAlignVertical.top,
//                   expands: true,
//                   maxLength: 300,
//                   maxLines: null,
//                   decoration: InputDecoration(
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: AppColor.mainColor, width: 1.0.w),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black, width: 1.0.w),
//                     ),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.pink, width: 1.0.w),
//                     ),
//                     hintStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
//                     labelStyle:
//                         TextStyle(color: Colors.black54, fontSize: 16.sp),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 24.h,
//               ),
//               ReuseableButton(
//                 onPressed: () {},
//                 text: 'Submit',
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
