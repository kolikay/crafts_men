import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../constants/const/cachedNetworkImage.dart';

class LandingPage2 extends StatelessWidget {
 const LandingPage2({Key? key}) : super(key: key);
  static const id = "landingPage2";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
              height: 90.h,
              width: 70.w,
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 50.h,
              width: 330.w,
              child: Text(
                'Forget the old rules. You can have the best people here',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            NormalText(
              text: 'Rigth now. Right here',
              color: kMainColor,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(
              height: 30,
            ),
            const CachedImage(
              imageUrl: 'https://i.imgur.com/wUXlPWZ.png',
              width: 323,
              height: 187,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'I want to sign up as;',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ReuseableButton(
                  backGroundColor: kMainColor,
                  textColor: kWhite,
                  text: 'Skill provider',
                  onPressed: () {},
                  width: 137.w,
                ),
                ReuseableButton(
                  backGroundColor: kWhite,
                  textColor: kMainColor,
                  text: 'User',
                  onPressed: () {},
                  width: 137.w,
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
