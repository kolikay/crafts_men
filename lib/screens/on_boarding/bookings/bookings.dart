import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bookings extends StatefulWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kWhite,
          title: NormalText(
            text: 'My Bookings',
            color: kMainColor,
            size: 20.sp,
            fontWeight: FontWeight.w500,
          ),
          bottom: TabBar(tabs: [
            NormalText(text: 'All'),
            NormalText(text: 'Active'),
            NormalText(text: 'Completed'),
            NormalText(text: 'Cancelled')
          ]),
        ),
        body: SizedBox(
          height: 812.h,
          width: 375.w,
          child: const TabBarView(children: [
            MyTabView(),
            MyTabView(),
             MyTabView(),
              MyTabView(),
          ]),
        ),
      ),
    ));
  }
}



class MyTabView extends StatefulWidget {
  const MyTabView({Key? key}) : super(key: key);

  @override
  State<MyTabView> createState() => _MyTabViewState();
}

class _MyTabViewState extends State<MyTabView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 375.w,
        height: 812.h,
        child: Column(
          children:const [BookingsTabs(), BookingsTabs(), BookingsTabs()],
        ),
      ),
    );
  }
}

class BookingsTabs extends StatelessWidget {
  const BookingsTabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 335.w,
        height: 220.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: kBlackDull,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NormalText(
                    text: 'Require Electricity service',
                    color: kMainColor,
                    size: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 24,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset('lib/assets/logoTrans.png'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 60.h,
                    width: 200.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NormalText(
                          text: 'Ali Muhammed',
                          color: kBlackDull,
                          size: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        NormalText(
                          text: '4.5',
                          color: kBlackDull,
                          size: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        NormalText(
                          text: 'August 8th 2023, 8.20pm',
                          color: kBlackDull,
                          size: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NormalText(
                    text: 'Booking ID: 43452',
                    color: kBlackDull,
                    size: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  NormalText(
                    text: 'completed',
                    color: Colors.green,
                    size: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ReuseableButton(
                text: 'View Details',
                onPressed: () {},
                width: 160.w,
                height: 40.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
