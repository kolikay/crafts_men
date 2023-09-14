import 'package:craftsmen/screens/change_password/passord_resetpin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';

import '../../constants/reusesable_widgets/reusable_info_widget.dart';

class EmailPasswordChangeScreen extends StatefulWidget {
  const EmailPasswordChangeScreen({Key? key}) : super(key: key);
  static const String id = 'password_change_screen';
  @override
  State<EmailPasswordChangeScreen> createState() =>
      _EmailPasswordChangeScreenState();
}

class _EmailPasswordChangeScreenState extends State<EmailPasswordChangeScreen> {
  final _emailCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 24.w),
            color: Colors.white,
            height: 80.h,
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  color: kMainColor,
                ),
                SizedBox(
                  width: 28.w,
                ),
                NormalText(
                  text: 'Forgot Password',
                  color: kMainColor,
                  size: 19.2.sp,
                )
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 26.w, right: 25.w),
            child: NormalText(
              text:
                  'Enter your email address and we will send you instructions on how to reset your password',
              size: 14.sp,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          MyTextField(
            controller: _emailCont,
            obcureText: false,
            keyBoardType: TextInputType.emailAddress,
            isPassword: false,
            isReadOnly: false,
            labelText: 'Email Address',
          ),
          SizedBox(
            height: 40.h,
          ),
          ReuseableButton(
            text: 'Send Email',
            textSize: 16.sp,
            onPressed: () {
              dialogBuilder(
                  context,
                  'lib/assets/emaillockicon.png',
                  'Email Sent',
                  'Reset instructions has been sent to email adeyemifatimah1@gmail.com',
                  'Proceed', () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PasswordResetPinScreen(),
                  ),
                );
              });
            },
          ),
        ],
      ),
    ));
  }
}
