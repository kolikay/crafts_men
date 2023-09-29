import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';






class DetailsPage1 extends StatelessWidget {
  const DetailsPage1(
      {Key? key,
      required GlobalKey<FormState> formKey,
      required TextEditingController compNameCont,
      required TextEditingController compEmailCont,
      required TextEditingController compPhoneCont,
      required TextEditingController compAddCont})
      : _formKey = formKey,
        _compNameCont = compNameCont,
        _compEmailCont = compEmailCont,
        _compPhoneCont = compPhoneCont,
        _compAddCont = compAddCont,
        super(key: key);
  final GlobalKey<FormState> _formKey;
  final TextEditingController _compNameCont;
  final TextEditingController _compEmailCont;
  final TextEditingController _compPhoneCont;
  final TextEditingController _compAddCont;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NormalText(
        text: 'Tell us about the service you render',
        size: 18.sp,
        fontWeight: FontWeight.w600,
      ),
      SizedBox(
        height: 25.h,
      ),
      NormalText(
        text:
            'Start the conversation and tell us the service you render to people. This helps us to know more about the service you can render in the society. Don’t worry, this can be edited later. ',
        size: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      SizedBox(
        height: 25.h,
      ),
      NormalText(
        text: 'Fill some details about your company/Business (your profession)',
        size: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      SizedBox(
        height: 25.h,
      ),
      Form(
        key: _formKey,
        child: Column(
          children: [
            MyTextField(
              controller: _compNameCont,
              obcureText: false,
              keyBoardType: TextInputType.text,
              isPassword: false,
              isReadOnly: false,
              labelText: 'Company Name',
            ),
            SizedBox(
              height: 35.h,
            ),
            MyTextField(
              controller: _compEmailCont,
              obcureText: false,
              keyBoardType: TextInputType.text,
              isPassword: false,
              isReadOnly: false,
              labelText: 'Email',
            ),
            SizedBox(
              height: 35.h,
            ),
            MyTextField(
              controller: _compPhoneCont,
              obcureText: false,
              keyBoardType: TextInputType.number,
              isPassword: false,
              isReadOnly: false,
              labelText: 'Phone Number',
            ),
            SizedBox(
              height: 35.h,
            ),
            SizedBox(
              height: 120.h,
              child: TextField(
                controller: _compAddCont,
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
                    borderSide: BorderSide(color: kMainColor, width: 1.0.w),
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
        height: 25.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ReuseableButton(
              width: 96.w, text: 'Next', textSize: 16.sp, onPressed: () {}),
        ],
      ),
    ]);
  }
}