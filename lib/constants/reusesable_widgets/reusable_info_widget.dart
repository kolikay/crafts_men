import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseableInfoWidget extends StatelessWidget {
  final String logo;
  final String maintext;
  final String detailsText;
  final String bottonText;
  final GestureTapCallback onPressed;


  const ReuseableInfoWidget(
      {Key? key,
      required this.logo,
      required this.maintext,
      required this.detailsText,
      required this.bottonText,
      required this.onPressed,
})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Dialog(
          backgroundColor: kDarkContainer,
          child: SizedBox(
            height: 410.h,
            width: 335.w,
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  height: 80.h,
                  width: 80.w,
                  child: Image.asset(
                    logo,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                NormalText(
                  text: maintext,
                  size: 20.h,
                  fontWeight: FontWeight.w500,
                ),
                 SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 18.h , horizontal: 18.h),
                  child: Text(detailsText, style: TextStyle(fontSize: 14.sp, ), textAlign: TextAlign.center, ),
                ),  SizedBox(
                  height: 25.h,
                ),
                ReuseableButton(text: bottonText,textSize: 14, onPressed: onPressed, width: 200.w,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
