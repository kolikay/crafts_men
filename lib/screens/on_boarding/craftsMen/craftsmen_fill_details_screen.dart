import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusable_app_bar1.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/constants/utils/progress_bar.dart';
import 'package:craftsmen/screens/auth/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CraftmenFillDetailsScreen extends ConsumerStatefulWidget {
  const CraftmenFillDetailsScreen({Key? key}) : super(key: key);
  static const String id = 'sign_up_screen';

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
    final authViewModel = ref.watch(authViewModelProvider);
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100.h),
              child: AppBar(
                backgroundColor: Colors.white,
                shadowColor: Colors.white,
                centerTitle: true,
                title: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: WormEffect(
                        dotWidth: 60.w,
                        dotHeight: 3.h,
                        activeDotColor: kMainColor,
                        dotColor: kDullMainColor),
                    onDotClicked: (index) => pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut),
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(left: 30.w, right: 20.w),
              child: SizedBox(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      isLastPage = index == 2;
                    });
                  },
                  children: [
                    DetailsPage1(
                        formKey: _formKey,
                        compNameCont: _compNameCont,
                        compEmailCont: _compEmailCont,
                        compPhoneCont: _compPhoneCont),
                    DetailsPage2(
                        compNameCont: _compNameCont,
                        compEmailCont: _compEmailCont,
                        compPhoneCont: _compPhoneCont),
                    DetailsPage3(
                        compNameCont: _compNameCont,
                        compEmailCont: _compEmailCont,
                        compPhoneCont: _compPhoneCont),
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

class DetailsPage1 extends StatelessWidget {
  const DetailsPage1({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController compNameCont,
    required TextEditingController compEmailCont,
    required TextEditingController compPhoneCont,
  })  : _formKey = formKey,
        _compNameCont = compNameCont,
        _compEmailCont = compEmailCont,
        _compPhoneCont = compPhoneCont,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _compNameCont;
  final TextEditingController _compEmailCont;
  final TextEditingController _compPhoneCont;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      NormalText(
        text: 'Tell us about the service you render',
        size: 18.sp,
        fontWeight: FontWeight.w600,
      ),
      SizedBox(
        height: 25.h,
      ),
      NormalText(
        text:
            'Start the conversation and tell us the service you render to people. This helps us to know more about the service you can render in the society. Don’t worry, this can be edited later. ',
        size: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      SizedBox(
        height: 25.h,
      ),
      NormalText(
        text: 'Fill some details about your company/Business (your profession)',
        size: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      SizedBox(
        height: 25.h,
      ),
      Form(
        key: _formKey,
        child: Column(
          children: [
            MyTextField(
              controller: _compNameCont,
              obcureText: false,
              keyBoardType: TextInputType.text,
              isPassword: false,
              isReadOnly: false,
              labelText: 'Company Name',
            ),
            SizedBox(
              height: 35.h,
            ),
            MyTextField(
              controller: _compEmailCont,
              obcureText: false,
              keyBoardType: TextInputType.text,
              isPassword: false,
              isReadOnly: false,
              labelText: 'Email',
            ),
            SizedBox(
              height: 35.h,
            ),
            MyTextField(
              controller: _compPhoneCont,
              obcureText: false,
              keyBoardType: TextInputType.number,
              isPassword: false,
              isReadOnly: false,
              labelText: 'Phone Number',
            ),
            SizedBox(
              height: 35.h,
            ),
            SizedBox(
              height: 120.h,
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                expands: true,
                maxLength: 100,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Enter Business Address',
                  hintStyle: TextStyle(color: kBlackDull, fontSize: 16.sp),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor, width: 1.0.w),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0.w),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 1.0.w),
                  ),
                  labelStyle: TextStyle(color: Colors.black54, fontSize: 16.sp),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 25.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ReuseableButton(
              width: 96.w, text: 'Next', textSize: 16.sp, onPressed: () {}),
        ],
      ),
    ]);
  }
}

class DetailsPage2 extends StatelessWidget {
  const DetailsPage2({
    Key? key,
    required TextEditingController compNameCont,
    required TextEditingController compEmailCont,
    required TextEditingController compPhoneCont,
  })  : _compNameCont = compNameCont,
        _compEmailCont = compEmailCont,
        _compPhoneCont = compPhoneCont,
        super(key: key);

  final TextEditingController _compNameCont;
  final TextEditingController _compEmailCont;
  final TextEditingController _compPhoneCont;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      NormalText(
        text: 'Tell us about the service you render',
        size: 18.sp,
        fontWeight: FontWeight.w600,
      ),
      SizedBox(
        height: 20.h,
      ),
      NormalText(
        text:
            'Start the conversation and tell us the service you render to people. This helps us to know more about the service you can render in the society. Don’t worry, this can be edited later. ',
        size: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      SizedBox(
        height: 20.h,
      ),
      NormalText(
        text: 'Fill some details about your company/Business (your profession)',
        size: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      SizedBox(
        height: 20.h,
      ),
      Form(
        child: Column(
          children: [
            MyTextField(
              controller: _compNameCont,
              obcureText: false,
              keyBoardType: TextInputType.text,
              isPassword: false,
              isReadOnly: false,
              labelText: 'Company Name',
            ),
            SizedBox(
              height: 20.h,
            ),
            MyTextField(
              controller: _compEmailCont,
              obcureText: false,
              keyBoardType: TextInputType.text,
              isPassword: false,
              isReadOnly: false,
              labelText: 'Email',
            ),
            SizedBox(
              height: 20.h,
            ),
            MyTextField(
              controller: _compPhoneCont,
              obcureText: false,
              keyBoardType: TextInputType.number,
              isPassword: false,
              isReadOnly: false,
              labelText: 'Phone Number',
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 120.h,
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                expands: true,
                maxLength: 100,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Enter Business Address',
                  hintStyle: TextStyle(color: kBlackDull, fontSize: 16.sp),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor, width: 1.0.w),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0.w),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 1.0.w),
                  ),
                  labelStyle: TextStyle(color: Colors.black54, fontSize: 16.sp),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ReuseableButton(
              width: 312.w, text: 'Next', textSize: 16.sp, onPressed: () {}),
        ],
      ),
    ]);
  }
}

class DetailsPage3 extends StatelessWidget {
  const DetailsPage3({
    Key? key,
    required TextEditingController compNameCont,
    required TextEditingController compEmailCont,
    required TextEditingController compPhoneCont,
  })  : _compNameCont = compNameCont,
        _compEmailCont = compEmailCont,
        _compPhoneCont = compPhoneCont,
        super(key: key);

  final TextEditingController _compNameCont;
  final TextEditingController _compEmailCont;
  final TextEditingController _compPhoneCont;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      NormalText(
        text: 'Tell us about the service you render',
        size: 18.sp,
        fontWeight: FontWeight.w600,
      ),
      SizedBox(
        height: 20.h,
      ),
      NormalText(
        text:
            'Start the conversation and tell us the service you render to people. This helps us to know more about the service you can render in the society. Don’t worry, this can be edited later. ',
        size: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      SizedBox(
        height: 20.h,
      ),
      NormalText(
        text: 'Fill some details about your company/Business (your profession)',
        size: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      SizedBox(
        height: 20.h,
      ),
      Form(
        child: Column(
          children: [
            MyTextField(
              controller: _compNameCont,
              obcureText: false,
              keyBoardType: TextInputType.text,
              isPassword: false,
              isReadOnly: false,
              labelText: 'Company Name',
            ),
            SizedBox(
              height: 20.h,
            ),
            MyTextField(
              controller: _compEmailCont,
              obcureText: false,
              keyBoardType: TextInputType.text,
              isPassword: false,
              isReadOnly: false,
              labelText: 'Email',
            ),
            SizedBox(
              height: 20.h,
            ),
            MyTextField(
              controller: _compPhoneCont,
              obcureText: false,
              keyBoardType: TextInputType.number,
              isPassword: false,
              isReadOnly: false,
              labelText: 'Phone Number',
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 120.h,
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                expands: true,
                maxLength: 100,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Enter Business Address',
                  hintStyle: TextStyle(color: kBlackDull, fontSize: 16.sp),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor, width: 1.0.w),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0.w),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 1.0.w),
                  ),
                  labelStyle: TextStyle(color: Colors.black54, fontSize: 16.sp),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ReuseableButton(
              width: 312.w, text: 'Next', textSize: 16.sp, onPressed: () {}),
        ],
      ),
    ]);
  }
}
