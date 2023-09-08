import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen1 extends StatefulWidget {
  const SignUpScreen1({Key? key}) : super(key: key);

  @override
  State<SignUpScreen1> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen1> {
  final _formKey = GlobalKey<FormState>();
  final _fullnameCont = TextEditingController();
  final _usernameCont = TextEditingController();
  final _facultyCont = TextEditingController();
  final _departmentCont = TextEditingController();

// Initial Selected Value
  String dropdownvalue = 'Male';

  // List of items in our dropdown menu
  var genders = [
    'Male',
    'Female',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 40.h, left: 30.w, right: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: 125.h,
                    width: 121.w,
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
                      text: 'Create an account',
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
                              controller: _fullnameCont,
                              obcureText: false,
                              keyBoardType: TextInputType.text,
                              isPassword: false,
                              isReadOnly: false,
                              labelText: 'Full Name',
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
                              controller: _usernameCont,
                              obcureText: false,
                              keyBoardType: TextInputType.text,
                              isPassword: false,
                              isReadOnly: false,
                              labelText: 'Username',
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
                              controller: _facultyCont,
                              obcureText: false,
                              keyBoardType: TextInputType.text,
                              isPassword: false,
                              isReadOnly: false,
                              labelText: 'Faculty',
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            MyTextField(
                              controller: _departmentCont,
                              obcureText: false,
                              keyBoardType: TextInputType.text,
                              isPassword: false,
                              isReadOnly: false,
                              labelText: 'Department',
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: 343.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(3.r),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  isDense: false,
                                  isExpanded: true,
                                  // Initial Value
                                  value: dropdownvalue,
                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  // Array list of items
                                  items: genders.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ReuseableButton(
                          text: 'Next',
                          textSize: 14.sp,
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            //   Navigator.of(context).push(
                            //     MaterialPageRoute(
                            //       builder: (context) => SignUpScreen2(
                            //         fullName: _fullnameCont.text,
                            //         userName: _usernameCont.text,
                            //         department: _departmentCont.text,
                            //         faculty: _facultyCont.text,
                            //         gender: dropdownvalue,
                            //       ),
                            //     ),
                            //   );
                            // }
                            // FocusScope.of(context).unfocus();
                          },
                          width: 90.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
