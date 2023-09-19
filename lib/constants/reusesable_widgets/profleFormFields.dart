// ignore_for_file: prefer_const_constructors

import 'package:craftsmen/constants/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool isPassword;
  final bool obcureText;
  final bool isReadOnly;
  final Color borderColor;
  final TextInputType keyBoardType;
   final bool enable;

  const ProfileFormField({
    Key? key,
    this.borderColor = kMainColor,
    this.controller,
    this.hintText,
    required this.isPassword,
    required this.obcureText,
    required this.isReadOnly,
    required this.labelText,
    required this.keyBoardType,
    this.enable = true,
  }) : super(key: key);

  @override
  State<ProfileFormField> createState() => _ProfileFormFieldState();
}

class _ProfileFormFieldState extends State<ProfileFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      child: TextFormField(
        controller: widget.controller,
        readOnly: widget.isReadOnly,
        obscureText: widget.obcureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          // focusedBorder: widget.enable? OutlineInputBorder(
          //   borderSide: BorderSide(color: kMainColor, width: 2.0.w),
          // ) : OutlineInputBorder(),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.black, width: 1.0.w),
          // ),
          // border: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.pink, width: 1.0.w),
          // ),
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w400),
     
        ),
     
      ),
    );
  }
}
