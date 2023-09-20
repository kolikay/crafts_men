import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/profleFormFields.dart';
import 'package:craftsmen/screens/search/searchScreensContants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleSearchScreen extends StatefulWidget {
  const SingleSearchScreen({Key? key}) : super(key: key);

  @override
  State<SingleSearchScreen> createState() => _SingleSearchScreenState();
}

class _SingleSearchScreenState extends State<SingleSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SizedBox(
          height: 812.h,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: kMainColor,
                      size: 14.sp,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  NormalText(
                    text: 'Service Provider Profile',
                    color: kMainColor,
                    size: 18.sp,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150.h,
                width: double.infinity,
                child: Image.asset(
                  'lib/assets/workerImage.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TabBar(
                padding: EdgeInsets.zero,
                indicatorColor: kMainColor,
                tabs: [
                  NormalText(
                    text: 'About',
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  NormalText(
                    text: 'Reviews',
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  NormalText(
                    text: 'Pictures',
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(
                height: 500.h,
                child: TabBarView(children: [
                  About(),
                  ReviwTabView(
                    tab: tabs,
                  ),
                  About(),
                ]),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
