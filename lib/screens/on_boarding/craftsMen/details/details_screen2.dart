import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/profleFormFields.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/screens/on_boarding/on_boarding_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPage2 extends StatefulWidget {
  const DetailsPage2({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsPage2> createState() => _DetailsPage2State();
}

class _DetailsPage2State extends State<DetailsPage2> {
  int employee = 0;
  int experince = 0;
  String? dat;
  bool? _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 335.w,
          height: 120.h,
          child: DottedBorder(
            strokeWidth: 1.sp,
            color: kDullMainColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image_rounded,
                    color: kMainColor,
                    size: 37.sp,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  NormalText(
                    text: 'Add your profile image',
                    size: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            NormalText(
              text: 'Personal website link (Optional)',
              size: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey[500],
            ),
            SizedBox(
              height: 5.h,
            ),
            const MyTextField(
                borderColor: Colors.grey,
                isPassword: false,
                obcureText: false,
                isReadOnly: false,
                labelText: 'Enter Personal Website Link',
                keyBoardType: TextInputType.text),
            SizedBox(
              height: 30.h,
            ),
            NormalText(
              text: 'Number of Employees working for you',
              size: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    if (employee > 0) {
                      setState(() {
                        employee--;
                      });
                    } else {
                      setState(() {
                        employee = 0;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: kDullMainColor,
                    ),
                    width: 60,
                    height: 50,
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Icon(
                        Icons.minimize_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    color: kWhite,
                  ),
                  width: 60,
                  height: 50,
                  child: Center(
                    child: NormalText(
                      text: employee.toString(),
                      size: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      employee++;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: kMainColor,
                    ),
                    width: 60,
                    height: 50,
                    child: const Icon(
                      Icons.add,
                      color: kWhite,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            NormalText(
              text: 'Years of Experience',
              size: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    if (experince > 0) {
                      setState(() {
                        experince--;
                      });
                    } else {
                      setState(() {
                        experince = 0;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: kDullMainColor,
                    ),
                    width: 60,
                    height: 50,
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Icon(
                        Icons.minimize_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    color: kWhite,
                  ),
                  width: 60,
                  height: 50,
                  child: Center(
                    child: NormalText(
                      text: experince.toString(),
                      size: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      experince++;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: kMainColor,
                    ),
                    width: 60,
                    height: 50,
                    child: const Icon(
                      Icons.add,
                      color: kWhite,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            NormalText(
              text: 'Year of Starting Business',
              size: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey[500],
            ),
            SizedBox(
              height: 5.h,
            ),
            const MyTextField(
                borderColor: Colors.grey,
                isPassword: false,
                obcureText: false,
                isReadOnly: false,
                labelText: 'Enter year you started your profession',
                keyBoardType: TextInputType.text),
            SizedBox(
              height: 15.h,
            ),
            NormalText(
              text: 'Profession Category',
              size: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey[500],
            ),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
              onTap: () {
                bottomSheet(context);
                // DateTime? pickedDate = await showDatePicker(
                //     context: context,
                //     initialDate: DateTime.now(),
                //     firstDate: DateTime(1950),
                //     lastDate: DateTime(2100));

                // setState(() {
                //   dateInput = pickedDate.toString().substring(0, 10);
                // });
              },
              child: Container(
                width: 335.w,
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
                        text: dat ?? 'Select your Profession category ',
                        color: kBlack,
                        size: 15,
                      ),
                      // SizedBox(height:150, width:100,child: TextField(controller: dateInput,)),
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: kMainColor,
                        size: 25.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ReuseableButton(
                    width: 96.w,
                    text: 'Next',
                    textSize: 16.sp,
                    onPressed: () {}),
              ],
            ),
          ],
        ),
      ],
    );
  }

  bottomSheet(BuildContext context) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) {
        return Container(
          padding: EdgeInsets.all(20.w),
          decoration: const BoxDecoration(
            color: kDarkContainer,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: 700.h,
          width: 375,
          child: Column(
            children: [
              const SizedBox(
                height: 0,
              ),
              Container(
                width: 80,
                height: 5,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              NormalText(
                text: 'Choose your Profession Category',
                color: kMainColor,
                size: 18,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 20,
              ),
              items(
                'Barbing',
                (check) {
                  setState(() {
                    _isChecked = check;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              items(
                'Teaching',
                (check) {
                  setState(() {
                    _isChecked = check;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              items(
                'Electricity',
                (check) {
                  setState(() {
                    _isChecked = check;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              items(
                'Baking',
                (check) {
                  setState(() {
                    _isChecked = check;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              items(
                'Plumbing',
                (check) {
                  setState(() {
                    _isChecked = check;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              items(
                'Catering & Food Service',
                (check) {
                  setState(() {
                    _isChecked = check;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              items(
                'Engineering',
                (check) {
                  setState(() {
                    _isChecked = check;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              items(
                'Medicine',
                (check) {
                  setState(() {
                    _isChecked = check;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget items(String name, Function(bool?) opressed) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              checkColor: kMainColor,
              value: _isChecked,
              onChanged: opressed,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            NormalText(
              text: name,
              size: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        Container(
          width: 325,
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
