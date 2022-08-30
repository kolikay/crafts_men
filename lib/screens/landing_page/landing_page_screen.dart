import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  color: Color(0xffF2A99C),
                  urlImage: 'https://i.imgur.com/FUQjrM7.png',
                  title: 'Welcome to SkillConnect',
                  subTitle:
                      'SkillConnect help you get the best service you might need',
                ),
                buildPage(
                  color: Color(0xff4D4D4DC),
                  urlImage: 'https://i.imgur.com/PPh1vo4.png',
                  title: 'Welcome to SkillConnect',
                  subTitle:
                      'Giving out the best that will meet your demand',
                ),
                buildPage(
                  color: Color(0xff92C4B3),
                  urlImage: 'https://i.imgur.com/RqaCElu.png',
                  title: 'Welcome to SkillConnect',
                  subTitle:
                      'We can come to your house, office or wherever works for you to render the services',
                ),
              ],
            ),
          ),
          bottomSheet: SizedBox(
            height: 200,
            child: Column(
              children: [
                Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: WormEffect(
                        dotWidth: 10.w,
                        dotHeight: 10.h,
                        activeDotColor: kMainColor,
                        dotColor: kBlackDull),
                    onDotClicked: (index) => pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                ReuseableButton(
                  height: 45.h,
                  text: !isLastPage? 'Next' : 'Get Started',
                  onPressed: () {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut);
                  },
                ),
                SizedBox(
                  height: 25.h,
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
      height: 512.h,
      width: 375.w,
      color: color,
      child: Stack(
        children: [
          Container(
            height: 476.h,
            width: 375.w,
            child: Image.network(urlImage),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(31.r),
                    topRight: Radius.circular(31.r)),
                color: kWhite,
              ),
              height: 415.h,
              width: 375.w,
              child: Column(children: [
                SizedBox(
                  height: 50.h,
                  width: 50.w,
                  child: Image.network('https://i.imgur.com/FUQjrM7.png'),
                ),
                SizedBox(
                  height: 40.h,
                ),
                NormalText(
                  text: title,
                  size: 19.2.sp,
                  color: kBlack,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 25.h,
                ),
                SizedBox(
                  width: 272.w,
                  height: 100.h,
                  child: NormalText(
                    text: subTitle,
                    size: 16.sp,
                    color: kBlackDull,
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
