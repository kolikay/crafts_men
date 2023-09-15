
// import 'package:flutter/material.dart';
// import 'package:scholars_padi/constants/appColor.dart';
// import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:scholars_padi/widgets/reusesable_widget/reusesable_appBar2.dart';
// // import 'dart:io';

// class ContactScreen extends StatefulWidget {
//   const ContactScreen({Key? key}) : super(key: key);

//   @override
//   State<ContactScreen> createState() => _ContactScreenState();
// }

// class _ContactScreenState extends State<ContactScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(103.h),
//         child: ReusesableAppBar2(
//           appBarTitle: 'Contact Us',
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
//                SizedBox(height: 24.h,),
//               Row(
//                 children: [
//                 const Icon(Icons.phone, color: AppColor.mainColor,),
//                 SizedBox(width: 20.w,),
//                 NormalText(text: 'Call', color:Colors.black, size: 18,fontWeight: FontWeight.w500,)
//               ],),
//               SizedBox(
//                 height: 70.h,
//                 width: 250,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     NormalText(text: '+234 9039539042', color: AppColor.dullerBlack, size: 16),
//                        SizedBox(height: 10.h,),
//                    NormalText(text: '+234 9064777159', color: AppColor.dullerBlack, size: 16),
//                 ],),
//               ),
//                      SizedBox(height: 24.h,),
//               Row(
//                 children: [
//                 const Icon(Icons.email, color: AppColor.mainColor,),
//                 SizedBox(width: 20.w,),
//                 NormalText(text: 'Email', color: Colors.black, size: 18,fontWeight: FontWeight.w500,)
//               ],),
//               SizedBox(
//                 height: 70.h,
//                 width: 250,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     NormalText(text: 'scholarspadi@gmail.com', color: AppColor.dullerBlack, size: 16),
//                        SizedBox(height: 10.h,),
//                    NormalText(text: '+scholarspadi@gmail.com', color: AppColor.dullerBlack, size: 16),
//                 ],),
//               ),
           
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// //  Column(children: [
// //              

// //               Column(
                 
// //                 children: [

// //                 ],
// //               ),
              
// //             ],),   Column(children: [
// //               Row(children: [
// //                 const Icon(Icons.email),
// //                 SizedBox(width: 14.w,),
// //                 NormalText(text: 'Email')
// //               ],),
// //               Column(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: [
// //                   NormalText(text: 'scohlarspadi@gmail.com'),
// //                    SizedBox(height: 10.h,),
// //               NormalText(text: 'scholarspadi@gmail.com'),
// //                 ],
// //               ),
             
// //             ],),