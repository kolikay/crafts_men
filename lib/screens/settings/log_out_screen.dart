import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LogOutScreen extends StatefulWidget {
  const LogOutScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        child: SizedBox(
          height: 278.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                NormalText(
                  text: 'Log Out',
                  fontWeight: FontWeight.w500,
                  size: 23.sp,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Divider(
                  color: kDarkContainer,
                  thickness: 1.h,
                ),
                SizedBox(
                  height: 14.h,
                ),
                NormalText(
                  text: 'Are you sure you want to log out?',
                  fontWeight: FontWeight.w600,
                  color: kDarkContainer,
                ),
                SizedBox(
                  height: 14.h,
                ),
                InkWell(
                  onTap: () {
                  
                  },
                  child: Container(
                    width: 220.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: kDarkContainer),
                    ),
                    child: Center(
                      child: NormalText(
                        text: 'Yes',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 220.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color:kDarkContainer)),
                    child: Center(
                      child: NormalText(
                        text: 'No',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
