import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPage3 extends StatelessWidget {
  const DetailsPage3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(
        width: 335.w,
        height: 107.h,
        child: DottedBorder(
          strokeWidth: 1.sp,
          color: kDullMainColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_rounded,
                  color: kMainColor,
                  size: 37.sp,
                ),
                SizedBox(
                  height: 10.h,
                ),
                NormalText(
                  text: 'Add your profile image',
                  size: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 35.h,
      ),
      SizedBox(
        height: 300.h,
        child: TextField(
          textAlignVertical: TextAlignVertical.top,
          expands: true,
          maxLength: 150,
          maxLines: null,
          decoration: InputDecoration(
            hintText: 'Enter Business Address',
            hintStyle: TextStyle(color: kBlackDull, fontSize: 16.sp),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kMainColor, width: 1.0.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kMainColor, width: 1.0.w),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink, width: 1.0.w),
            ),
            labelStyle: TextStyle(color: Colors.black54, fontSize: 16.sp),
          ),
        ),
      ),
      SizedBox(height: 20.h,),
      ReuseableButton(text: 'Submit', onPressed: (){})
    ]);
  }
}
