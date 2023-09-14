import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/screens/location/location_screen2.dart';
import 'package:flutter/material.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);
  static const String id = 'location_screen';

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            children: [
              SizedBox(
                height: 120.h,
                width: 103.w,
                child: Image.asset('lib/assets/logoTrans.png'),
              ),
              SizedBox(
                height: 15.h,
              ),
              NormalText(
                text: 'Its Nice to see you again!',
                fontWeight: FontWeight.w600,
                size: 20.sp,
                color: kMainColor,
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 227.h,
                width: 322.w,
                child: Image.asset('lib/assets/locationImage.png'),
              ),
              Text(
                'Add your address to serve you better with various services around you',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kBlackDull,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              const MyTextField(
                isPassword: false,
                obcureText: false,
                isReadOnly: false,
                labelText: 'Enter Location Address',
                keyBoardType: TextInputType.text,
              ),
              SizedBox(
                height: 15.h,
              ),
              ReuseableButton(
                  text: "Proceed",
                  onPressed: () {
                    Navigator.pushNamed(context, LocationScreen2.id);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
