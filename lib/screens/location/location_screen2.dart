import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class LocationScreen2 extends StatefulWidget {
  const LocationScreen2({Key? key}) : super(key: key);
   static const String id = 'location_screen2';

  @override
  State<LocationScreen2> createState() => _LocationScreen2State();
}

class _LocationScreen2State extends State<LocationScreen2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Column(
            children: [
                 SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 124.h,
                width: 103.w,
                child: Image.asset('lib/assets/logoTrans.png'),
              ),
              SizedBox(
                height: 55.h,
              ),
              NormalText(
                text: 'You are In',
                fontWeight: FontWeight.w600,
                size: 34.sp,
                color: kMainColor,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                """Thanks for taking time your time to create an account 
                with us. Now this is the fun part. Let’s explore the app """,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kBlackDull,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              ReuseableButton(text: 'Start', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
