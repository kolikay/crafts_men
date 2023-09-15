// import 'package:flutter/material.dart';
// import 'package:scholars_padi/constants/appColor.dart';
// import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ThemesSettingScreen extends StatefulWidget {
//   const ThemesSettingScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ThemesSettingScreen> createState() => _ThemesSettingScreenState();
// }

// class _ThemesSettingScreenState extends State<ThemesSettingScreen> {
//   String? gender;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Dialog(
//         child: SizedBox(
//           height: 230.h,
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               SizedBox(
//                 height: 15.h,
//               ),
//               NormalText(
//                 text: 'Choose themes',
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//                 size: 19.sp,
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               ListTile(
//                 title: NormalText(
//                   text: 'Light',
//                   color: Colors.black45,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 leading: Radio(
//                     activeColor: AppColor.mainColor,
//                     value: "Light",
//                     groupValue: gender,
//                     onChanged: (value) {
//                       setState(() {
//                         gender = value.toString();
//                       });
//                     }),
//               ),
//               ListTile(
//                 title: NormalText(
//                   text: 'Dark',
//                   color: Colors.black45,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 leading: Radio(
//                     activeColor: AppColor.mainColor,
//                     value: "Dark",
//                     groupValue: gender,
//                     onChanged: (value) {
//                       setState(() {
//                         gender = value.toString();
//                       });
//                     }),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: NormalText(
//                       text: 'CANCEL',
//                       color: AppColor.mainColor,
//                       size: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: NormalText(
//                       text: 'OK',
//                       color: AppColor.mainColor,
//                       size: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               )
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
