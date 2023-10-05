// ignore_for_file: use_build_context_synchronously

import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/constants/utils/progress_bar.dart';
import 'package:craftsmen/constants/utils/snack_bar.dart';
import 'package:craftsmen/screens/auth/views/login_screen.dart';
import 'package:craftsmen/screens/auth/views/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusable_info_widget.dart';

class SignUpScreen2 extends ConsumerStatefulWidget {
  final String fullName;
  final String userName;
  final String phoneNumber;
  final String gender;
  final String address;

  const SignUpScreen2({
    Key? key,
    required this.fullName,
    required this.userName,
    required this.phoneNumber,
    required this.gender,
    required this.address,
  }) : super(key: key);
  @override
  ConsumerState<SignUpScreen2> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen2> {
  bool _isObscure = true;
  bool _isObscure1 = true;
  final _formKey = GlobalKey<FormState>();
  final _emailCont = TextEditingController();
  final _password1Cont = TextEditingController();

  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h, left: 30.w, right: 15.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                        height: 125.h,
                        width: 121.h,
                        child: Image.asset(
                          'lib/assets/logoTrans.png',
                          fit: BoxFit.contain,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 36.h,
                        ),
                        NormalText(
                          text: 'Create Account',
                          size: 23.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              MyTextField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Field Cannot be empty';
                                  }
                                  return null;
                                },
                                controller: _emailCont,
                                obcureText: false,
                                keyBoardType: TextInputType.emailAddress,
                                isPassword: false,
                                isReadOnly: false,
                                labelText: 'Email Address',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              MyTextField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Field Cannot be empty';
                                  }
                                  return null;
                                },
                                controller: _password1Cont,
                                obcureText: _isObscure,
                                keyBoardType: TextInputType.text,
                                isPassword: true,
                                isReadOnly: false,
                                labelText: 'Password',
                                sufixIcon: IconButton(
                                  color: Colors.black54,
                                  icon: Icon(_isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              MyTextField(
                                validator: (pass) {
                                  if (pass != _password1Cont.text) {
                                    return 'Password Dont match';
                                  }
                                  return null;
                                },
                                obcureText: _isObscure,
                                keyBoardType: TextInputType.text,
                                isPassword: true,
                                isReadOnly: false,
                                labelText: 'Confirm Password',
                                sufixIcon: IconButton(
                                  color: Colors.black54,
                                  icon: Icon(_isObscure1
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure1 = !_isObscure1;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        SizedBox(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 25.w,
                                    child: Checkbox(
                                        value: _isChecked,
                                        onChanged: (check) {
                                          setState(() {
                                            _isChecked = check;
                                          });
                                        }),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: kBlack,
                                        fontSize: 14.sp,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' By clicking I agree to the ',
                                          style: TextStyle(
                                              color: kBlack, fontSize: 14.sp),
                                        ),
                                        TextSpan(
                                          text: 'Terms & Conditions',
                                          style: TextStyle(
                                              color: kBlack,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: kBlack,
                                    fontSize: 14.sp,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'and ',
                                        style: TextStyle(
                                            color: kBlack, fontSize: 14.sp)),
                                    TextSpan(
                                      text: 'Privacy Policy.',
                                      style: TextStyle(
                                          color: kBlack,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        ReuseableButton(
                          textSize: 14.sp,
                          text: 'Sign Up',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final response = await authViewModel.signUpUser(
                                  username: widget.userName.trim(),
                                  fullname: widget.fullName.trim(),
                                  address: widget.address.trim(),
                                  phoneNumber: widget.phoneNumber.trim(),
                                  gender: widget.gender,
                                  email: _emailCont.text,
                                  password: _password1Cont.text);

                              if (response == 'Success') {
                                dialogBuilder(
                                    context,
                                    'lib/assets/verifiedIcon.png',
                                    'Congratulations',
                                    'Your account has been successfully created. Kindly go to your email to verify your account',
                                    'Confirm Email', () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const VerifyOtpScreen(),
                                    ),
                                  );
                                });
                              } else {
                                ShowSnackBar.buildErrorSnackbar(
                                    context, response.toString(), Colors.red);
                              }
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16.sp,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Already have an account? ',
                                    style: TextStyle(fontSize: 14.sp)),
                                TextSpan(
                                  text: 'Sign In',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: kMainColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: authViewModel.loading
                  ? const Center(
                      child: ProgressDialog(
                        message: 'Loading....',
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
