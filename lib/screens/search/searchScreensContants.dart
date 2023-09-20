import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/profleFormFields.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final _fullnameCont = TextEditingController();
  final _awayFromYouCont = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();
  final _yOE = TextEditingController();
  final _started = TextEditingController();
  final _ratings = TextEditingController();
  final _jobCompleted = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _email.text = 'kolikay2gmail.com';
    _fullnameCont.text = 'kolawole fabusuyi';
    _awayFromYouCont.text = 'kolikay';
    _phone.text = "08062842978";
    _address.text = 'No 27, Kenneth Street, Ikoyi,Lagos state';
    _yOE.text = "4 years";
    _started.text = "2020";
    _ratings.text = '4.5';
    _jobCompleted.text = "47";

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          ProfileFormField(
            labelText: 'Full Name',
            controller: _fullnameCont,
          ),
          SizedBox(
            height: 15.h,
          ),
          ProfileFormField(
            labelText: 'Email',
            controller: _email,
          ),
          SizedBox(
            height: 15.h,
          ),
          ProfileFormField(
            labelText: 'Away From You',
            controller: _awayFromYouCont,
          ),
          SizedBox(
            height: 15.h,
          ),
          ProfileFormField(
            labelText: 'Address',
            controller: _address,
          ),
          SizedBox(
            height: 15.h,
          ),
          ProfileFormField(
            labelText: 'Years Of Experience',
            controller: _yOE,
          ),
          SizedBox(
            height: 15.h,
          ),
          ProfileFormField(
            labelText: 'Phone Number',
            controller: _phone,
          ),
          SizedBox(
            height: 15.h,
          ),
          ProfileFormField(
            labelText: 'Year Started Business',
            controller: _started,
          ),
          SizedBox(
            height: 15.h,
          ),
          ProfileFormField(
            labelText: 'Ratings',
            controller: _ratings,
          ),
          SizedBox(
            height: 15.h,
          ),
          ProfileFormField(
            labelText: 'Jobs Completed',
            controller: _jobCompleted,
          ),
        ],
      ),
    );
  }
}

List<Widget> tabs = const [
  ReviewCards(),
  ReviewCards(),
  ReviewCards(),
];

class ReviwTabView extends StatefulWidget {
  final List<Widget> tab;

  const ReviwTabView({Key? key, required this.tab}) : super(key: key);

  @override
  State<ReviwTabView> createState() => _ReviwTabViewState();
}

class _ReviwTabViewState extends State<ReviwTabView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: 375.w,
          height: 812.h,
          child: Column(
            children: widget.tab,
          ),
        ),
      ),
    );
  }
}

class ReviewCards extends StatelessWidget {
  const ReviewCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0, right: 20),
      child: Column(
        children: [
          SizedBox(height: 15.h,),
          Row(
            children: [
              SizedBox(
                width: 50.w,
                height: 121.h,
                child: Column(
                  children: [
                    Container(
                      height: 50.h,
                      width: 80.w,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('lib/assets/workerImage.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 31,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 270.w,
                height: 121.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: NormalText(
                            text: 'iniola David',
                            color: kBlack,
                            size: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        NormalText(
                          text: '09/08/2023',
                          color: kBlackDull,
                          size: 14.sp,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Color(0xffF3B21A),
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Color(0xffF3B21A),
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Color(0xffF3B21A),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10),
                      child: SizedBox(
                        width: 281.w,
                        height: 66.h,
                        child: const Text(
                          "He arrived on time. Very prompt and his work is excellent.He fixed my freezer appropriately with some other appliances faulty",
                          style: TextStyle(
                            color: kBlackDull,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(color: kBlackDull, thickness: 1,),
        ],
      ),
    );
  }
}
