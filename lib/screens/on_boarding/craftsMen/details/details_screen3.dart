// ignore_for_file: use_build_context_synchronously

import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusable_info_widget.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/constants/utils/progress_bar.dart';
import 'package:craftsmen/screens/auth/views/verify_otp_screen.dart';
import 'package:craftsmen/screens/on_boarding/on_boarding_screen.dart';
import 'package:craftsmen/screens/settings/user_settings_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPage3 extends ConsumerStatefulWidget {
  final PageController control;
    final String? user;
  const DetailsPage3({
    Key? key,
    required this.control,
    required this.user
  }) : super(key: key);

  @override
  ConsumerState<DetailsPage3> createState() => _DetailsPage3State();
}

class _DetailsPage3State extends ConsumerState<DetailsPage3> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    return Stack(
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            width: 335.w,
            height: 120.h,
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
                hintText: 'More about your business',
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
          SizedBox(
            height: 20.h,
          ),
          ReuseableButton(
              text: 'Submit',
              onPressed: () async {
                // print(getInputedData());
                dialogBuilder(
                    context,
                    'lib/assets/verifiedIcon.png',
                    'Thank You',
                    'Thanks for taking your time to fill the details. Once your service is needed, you will be notify  ',
                    'View Details', () {
                  // Navigator.pushNamed(context, OnBoardingScreen.id);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OnBoardingScreen(user: widget.user),
                    ),
                  );
                });
              }),
        ]),
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
    );
  }
}
