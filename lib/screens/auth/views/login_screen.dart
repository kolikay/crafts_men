import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/constants/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final authViewModel = ref.watch(authViewModelProvider);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
                child: Column(
                  children: [
                    SizedBox(
                        height: 125.h,
                        width: 121.21.w,
                        child: Image.asset(
                          'lib/assets/logo.png',
                          fit: BoxFit.contain,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 36.h,
                        ),
                        NormalText(
                          text: 'Sign In',
                          size: 23,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        NormalText(
                          text: 'Enter your info to continue',
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        Visibility(
                          // visible: authViewModel.loginError,
                          child: Container(
                            color: Colors.pink[100],
                            height: 100.h,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5.h,
                                ),
                                SizedBox(
                                    child: Icon(
                                  Icons.ac_unit,
                                  color: const Color(0xffD32f2f),
                                  size: 24.w,
                                )),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                    child: NormalText(
                                  text:
                                      'we didnt recognize that email address \nor password you can try again or use\n another login option',
                                  color: Colors.black54,
                                  size: 14.sp,
                                )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                MyTextField(
                                  key: const Key('testKeyEmail'),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'The Email Field is required';
                                    }
                                    return null;
                                  },
                                  controller: emailController,
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
                                  key: const Key('testKeyPassword'),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'The password Field is required';
                                      }
                                      return null;
                                    },
                                    controller: passwordController,
                                    obcureText: _isObscure,
                                    keyBoardType: TextInputType.text,
                                    isPassword: true,
                                    isReadOnly: false,
                                    labelText: 'Enter Password',
                                    sufixIcon: IconButton(
                                        color: kBlackDull,
                                        icon: Icon(_isObscure
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        })),
                              ],
                            )),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                               key: const Key('testKeyloginButton'),
                              onPressed: () {
                                // pushEmailPasswordChangeScreen(context);
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: NormalText(
                                size: 14.sp,
                                text: 'Forgot Password?',
                                color: kMainColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReuseableButton(
                              height: 55.h,
                              width: 290.h,
                              text: 'Sign In',
                              textSize: 14.sp,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  // authViewModel.loginUser(
                                  //     '$baseApi/account/login/',
                                  //     {
                                  //       "email": emailController.text.trim(),
                                  //       "password":
                                  //           passwordController.text.trim(),
                                  //     },
                                  //     context);
                                }
                                FocusScope.of(context).unfocus();
                                // pushOnBoardingScreen(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            // pushSignUpScreen1(context);
                          },
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16.sp,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Dont have an account? ',
                                    style: TextStyle(
                                        color: kBlackDull,
                                        fontSize: 14.sp)),
                                TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(
                                      color: kMainColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp),
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
            // Positioned(
            //   child: authViewModel.loading
            //       ? const Center(
            //           child: ProgressDialog(
            //             message: 'Loading....',
            //           ),
            //         )
            //       : const SizedBox(),
            // ),
          ],
        ),
        // : const ProgressDialog(
        //     message: 'Loading....',
        //   ),
      ),
    );
  }
}
