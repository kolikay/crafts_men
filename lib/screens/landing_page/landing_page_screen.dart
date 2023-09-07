import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/const/cachedNetworkImage.dart';
import '../../routes/page_routes.dart';
import 'landing_page_screen2.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PageController pageController;
  int currentPage = 0;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();

    pageController = PageController(
      initialPage: currentPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: kWhite,
          body: SizedBox(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == 2;
                });
              },
              children: [
                buildPage(
                  color: kWhite,
                  urlImage: 'https://i.imgur.com/FUQjrM7.png',
                  title: 'Welcome to SkillConnect',
                  subTitle:
                      'SkillConnect help you get the best service you might need',
                ),
                buildPage(
                  color: kWhite,
                  urlImage: 'https://i.imgur.com/PPh1vo4.png',
                  title: 'Welcome to SkillConnect',
                  subTitle: 'Giving out the best that will meet your demand',
                ),
                buildPage(
                  color: kWhite,
                  urlImage: 'https://i.imgur.com/RqaCElu.png',
                  title: 'Welcome to SkillConnect',
                  subTitle:
                      'We can come to your house, office or wherever works for you to render the services',
                ),
              ],
            ),
          ),
          bottomSheet: Container(
            color: kDullWhite,
            height: 150,
            child: Column(
              children: [
               const SizedBox(height: 10,),
                Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: WormEffect(
                        dotWidth: 10.w,
                        dotHeight: 10.h,
                        activeDotColor: kWhite,
                        dotColor: kBlackDull),
                    onDotClicked: (index) => pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                ReuseableButton(
                  height: 45.h,
                  text: !isLastPage ? 'Next' : 'Get Started',
                  onPressed: () {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut);
                    isLastPage
                        ? Navigator.of(context).pushNamed(LandingPage2.id)
                        : null;
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextButton(
                  onPressed: () {
                    pageController.jumpToPage(2);
                  },
                  child: NormalText(
                    text: 'Skip',
                    size: 14.sp,
                    color: kMainColor,
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subTitle,
  }) {
    return Container(
      color: color,
      child: Stack(
        children: [
          CachedImage(
            imageUrl: urlImage,
            width: 375,
            height: 476,
          ),
          Positioned(
            bottom: 0.0,
            child: Container(          
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(31.r),
                    topRight: Radius.circular(31.r)),
                color: kDullWhite,
              ),
              height: 376.h,
              width: 375.w,
              child: Column(children: [
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 60.h,
                  width: 60.w,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(
                  height: 20.h,
                ),
                NormalText(
                  text: title,
                  size: 19.2.sp,
                  color: kBlack,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: 272.w,
                  height: 100.h,
                  child: Text(
                    subTitle,
                    style: TextStyle(fontSize: 16.sp, color: kBlackDull),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
