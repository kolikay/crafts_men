import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusesable_appBar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceDetailsScreen extends StatefulWidget {
  ServiceDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  // TextEditingController dateInput = TextEditingController();
  String? dateInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReusesableAppBar2(
          appBarTitle: 'Service Details',
          firstButton: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kMainColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 800.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                NormalText(
                  text: 'Select Date and Time you want the service to be done.',
                  fontWeight: FontWeight.w600,
                  size: 16.sp,
                  color: kBlack,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NormalText(
                          text: 'Date.',
                          size: 14.sp,
                          color: kBlackDull,
                        ),
                        InkWell(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100));
      
                            setState(() {
                              dateInput = pickedDate.toString().substring(0, 10);
                            });
                          },
                          child: Container(
                            width: 153.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: kBlackDull),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  NormalText(
                                    text: dateInput ?? 'Select Date',
                                    color: kBlack,
                                    size: 15,
                                  ),
                                  // SizedBox(height:150, width:100,child: TextField(controller: dateInput,)),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: kMainColor,
                                    size: 14.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NormalText(
                          text: 'Time.',
                          size: 14.sp,
                          color: kBlackDull,
                        ),
                        Container(
                          width: 153.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: kBlackDull),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: SizedBox(
                            width: 153.w,
                            height: 48.h,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left:10.w, bottom: 5.h),
                                border: InputBorder.none,
                                hintText: 'Enter Date',
                                hintStyle:
                                    TextStyle(color: kBlack, fontSize: 15.sp),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                      text: 'Service Description.',
                      size: 15.sp,
                      color: kBlackDull,
                    ),
                    SizedBox(
                      height: 300.h,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.top,
                        expands: true,
                        maxLength: 300,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'Enter more details about the service',
                          hintStyle:
                              TextStyle(color: kBlackDull, fontSize: 16.sp),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kMainColor, width: 1.0.w),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0.w),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.pink, width: 1.0.w),
                          ),
                          labelStyle:
                              TextStyle(color: Colors.black54, fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                ReuseableButton(
                  onPressed: () {},
                  text: 'Submit',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
