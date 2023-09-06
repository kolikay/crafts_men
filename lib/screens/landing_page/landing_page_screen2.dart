import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPage2 extends StatelessWidget {
  LandingPage2({Key? key}) : super(key: key);
  static const id = "landingPage2";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 90.h,
              width: 75.w,
              child: Image.asset('images/logo_white.png'),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 50.h,
              width: 330.w,
              child: Text(
                'Forget the old rules. You can have the best people here',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            NormalText(text: 'Rigth now. Right here', color: kMainColor, fontWeight: FontWeight.w800,),
          ],
        ),
      ),
    ));
  }
}
