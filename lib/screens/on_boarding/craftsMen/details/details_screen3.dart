




import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPage3 extends StatelessWidget {
  const DetailsPage3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      NormalText(
        text: 'Tell us about the service you render',
        size: 18.sp,
        fontWeight: FontWeight.w600,
      ),
      SizedBox(
        height: 20.h,
      ),
      NormalText(
        text:
            'Start the conversation and tell us the service you render to people. This helps us to know more about the service you can render in the society. Don’t worry, this can be edited later. ',
        size: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      SizedBox(
        height: 20.h,
      ),
      NormalText(
        text: 'Fill some details about your company/Business (your profession)',
        size: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      SizedBox(
        height: 20.h,
      ),
      Form(
        child: Column(
          children: [
            MyTextField(
              obcureText: false,
              keyBoardType: TextInputType.text,
              isPassword: false,
              isReadOnly: false,
              labelText: 'Company Name',
            ),
            SizedBox(
              height: 20.h,
            ),
            MyTextField(
              obcureText: false,
              keyBoardType: TextInputType.text,
              isPassword: false,
              isReadOnly: false,
              labelText: 'Email',
            ),
            SizedBox(
              height: 20.h,
            ),
            MyTextField(
              obcureText: false,
              keyBoardType: TextInputType.number,
              isPassword: false,
              isReadOnly: false,
              labelText: 'Phone Number',
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 120.h,
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                expands: true,
                maxLength: 100,
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
                    borderSide: BorderSide(color: Colors.black, width: 1.0.w),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 1.0.w),
                  ),
                  labelStyle: TextStyle(color: Colors.black54, fontSize: 16.sp),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ReuseableButton(
              width: 312.w, text: 'Next', textSize: 16.sp, onPressed: () {}),
        ],
      ),
    ]);
  }
}
