import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/models/skillProvider_models.dart';
import 'package:craftsmen/screens/search/searchScreensContants.dart';

import 'package:craftsmen/screens/search/serviceDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleSearchScreen extends StatefulWidget {
  final SkillProviderModel craftManDetails;
  const SingleSearchScreen({Key? key, required this.craftManDetails})
      : super(key: key);

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
          height: 800.h,
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
                      size: 20.sp,
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
                    size: 20.sp,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              widget.craftManDetails.profilePic == ''
                  ? SizedBox(
                      height: 150.h,
                      width: double.infinity,
                      child: Image.asset(
                        'lib/assets/workerImage.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  : SizedBox(
                      height: 150.h,
                      width: double.infinity,
                      child: Image.network(
                        widget.craftManDetails.profilePic!,
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
                height: 450.h,
                child: TabBarView(children: [
                  AboutTabView(craftManDetails: widget.craftManDetails),
                  ReviwTabView(
                      tab: tabs, craftManDetails: widget.craftManDetails),
                  WorkPhotoTabView(craftManDetails: widget.craftManDetails),
                ]),
              ),
            ],
          ),
        ),
        bottomSheet: SizedBox(
          height: 60.h,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                ReuseableButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => ServiceDetailsScreen()),
                      ),
                    );
                  },
                  text: "Book",
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
