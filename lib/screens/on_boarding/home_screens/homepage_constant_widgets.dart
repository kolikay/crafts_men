import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeConstants {
  static int activeImageIndex = 0;

  static List<String> images = [
    'lib/assets/homepageAdvert.png',
    'lib/assets/homepageAdvert.png',
    'lib/assets/homepageAdvert.png',
  ];

  static Widget buildImage(String image, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
      ),
    );
  }

  static Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeImageIndex,
      count: images.length,
      effect: WormEffect(
          dotWidth: 8.0.w,
          dotHeight: 8.0.h,
          activeDotColor: kBlackDull,
          dotColor: Colors.black12),
    );
  }

  static InkWell newInkwell(BuildContext context, String label, String imgUrl,
      GestureTapCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ResizeImage(AssetImage(imgUrl), height: 30, width: 30),
                ),
              ),
            ),
            NormalText(
              text: label,
              size: 10.sp,
            ),
          ],
        ),
      ),
    );
  }
}
