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

    pageController =
        PageController(initialPage: currentPage, viewportFraction: 0.0.w);
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
                urlImage: 'https://imgur.com/a/mcs6qSQ',
                title: 'Welcome to SkillConnect',
                subTitle: 'SkillConnect help you get the best service you might need',
              ),
               buildPage(
                color: Color(0xffF2A99C),
                urlImage: 'https://imgur.com/a/mcs6qSQ',
                title: 'Welcome to SkillConnect',
                subTitle: 'SkillConnect help you get the best service you might need',
              ),
               buildPage(
                color: Color(0xffF2A99C),
                urlImage: 'https://imgur.com/a/mcs6qSQ',
                title: 'Welcome to SkillConnect',
                subTitle: 'SkillConnect help you get the best service you might need',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subTitle,
  }) {
    return Container(
      height: 812.h,
      width: 375.w,
      color: color,
      child: Stack(
        children: [
          Container(
            height: 476.h,
            width: 375.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              image: DecorationImage(
                  image: NetworkImage(urlImage), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            child: SizedBox(
              height: 415.h,
              width: 375.w,
              child: Column(children: [
                SizedBox(
                  height: 50.h,
                  width: 5.w,
                  child: Image.asset('lib/assets/images/logo.png'),
                ),
                SizedBox(
                  height: 40.h,
                ),
                NormalText(
                  text: title,
                  size: 19.2.sp,
                  color: kMainColor,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 25.h,
                ),
                NormalText(
                  text: subTitle,
                  size: 16.sp,
                  color: Colors.black54,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: WormEffect(
                        dotWidth: 10.w,
                        dotHeight: 10.h,
                        activeDotColor: kMainColor,
                        dotColor: Colors.black12),
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
                  text: 'Next',
                  onPressed: () {},
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
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
