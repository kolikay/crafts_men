import 'dart:async';

import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/screens/location/location_screen2.dart';
import 'package:flutter/material.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_place/google_place.dart';

import '../../constants/const/app_state_constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({Key? key}) : super(key: key);
  static const String id = 'location_screen';

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late GooglePlace googlePlace;
  TextEditingController location = TextEditingController();
  List<AutocompletePrediction> predictions = [];
  Timer? _debounce;

  DetailsResult? startSearch;
  late FocusNode startFocusNode;

  @override
  void initState() {
    super.initState();
    String apiKey = 'AIzaSyD8sWntz2nx2hmtohvlGQWGu-9OjnBMGBc';
    googlePlace = GooglePlace(apiKey);
    startFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    startFocusNode.dispose();
  }

  autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);

    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Column(
              children: [
                SizedBox(
                  height: 120.h,
                  width: 103.w,
                  child: Image.asset('lib/assets/logoTrans.png'),
                ),
                SizedBox(
                  height: 15.h,
                ),
                NormalText(
                  text: 'Its Nice to see you again!',
                  fontWeight: FontWeight.w600,
                  size: 20.sp,
                  color: kMainColor,
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 227.h,
                  width: 322.w,
                  child: Image.asset('lib/assets/locationImage.png'),
                ),
                Text(
                  'Add your address to serve you better with various services around you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kBlackDull,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                MyTextField(
                  focus: startFocusNode,
                  controller: location,
                  isPassword: false,
                  obcureText: false,
                  isReadOnly: false,
                  labelText: 'Enter Location Address',
                  keyBoardType: TextInputType.text,
                  onChanged: (value) {
                    if (_debounce?.isActive ?? false) _debounce!.cancel();
                    _debounce = Timer(const Duration(milliseconds: 1000), () {
                      if (value.isNotEmpty) {
                        autoCompleteSearch(value);
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: predictions.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          child: Icon(
                            Icons.pin_drop,
                            color: Colors.white,
                          ),
                        ),
                        title: NormalText(
                            text: predictions[index].description.toString()),
                        onTap: () async {
                          final placeId = predictions[index].placeId!;
                          final details =
                              await googlePlace.details.get(placeId);
                          if (details != null &&
                              details.result != null &&
                              mounted) {
                            setState(() {
                              startSearch = details.result;
                              location.text = details.result!.name!;
                              predictions = [];
                            });
                          }
                        },
                      );
                    })),
                ReuseableButton(
                    text: "Proceed",
                    onPressed: () {
                      Navigator.pushNamed(context, LocationScreen2.id);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
