import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/screens/on_boarding/craftsMen/details/detail_screen1.dart';
import 'package:craftsmen/screens/on_boarding/craftsMen/details/details_screen2.dart';
import 'package:craftsmen/screens/on_boarding/craftsMen/details/details_screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CraftmenFillDetailsScreen extends ConsumerStatefulWidget {
  const CraftmenFillDetailsScreen({Key? key}) : super(key: key);
  // static const String id = 'sign_up_screen';

  @override
  ConsumerState<CraftmenFillDetailsScreen> createState() =>
      _CraftmenFillDetailsScreenState();
}

class _CraftmenFillDetailsScreenState
    extends ConsumerState<CraftmenFillDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _compNameCont = TextEditingController();
  final _compEmailCont = TextEditingController();
  final _compPhoneCont = TextEditingController();
  final _compAdd = TextEditingController();

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
      child: Stack(
        children: [
          Scaffold(
            body: Padding(
              padding: EdgeInsets.only(left: 30.w, right: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: WormEffect(
                            dotWidth: 60.w,
                            dotHeight: 3.h,
                            activeDotColor: kMainColor,
                            dotColor: kDullMainColor),
                        onDotClicked: (index) => pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 800,
                        child: PageView(
                          controller: pageController,
                          onPageChanged: (index) {
                            setState(() {
                              isLastPage = index == 2;
                            });
                          },
                          children: [
                            DetailsPage1(
                              control: pageController,
                              formKey: _formKey,
                              compNameCont: _compNameCont,
                              compEmailCont: _compEmailCont,
                              compPhoneCont: _compPhoneCont,
                              compAddCont: _compAdd,
                            ),
                             DetailsPage2(control: pageController,),
                             DetailsPage3(control: pageController,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
