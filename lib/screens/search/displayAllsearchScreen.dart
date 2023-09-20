import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusesable_appBar2.dart';
import 'package:craftsmen/constants/reusesable_widgets/searchDisplayCards.dart';
import 'package:craftsmen/screens/search/singleSearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayAllSearchScreen extends StatelessWidget {
  const DisplayAllSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(103.h),
          child: ReusesableAppBar2(
            appBarTitle: 'Nearby Electricians',
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
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: 850,
            child: Column(
              children: [
                SearchDisplayCard(
                  name: 'Ali Muhammed',
                  imageUrl: 'lib/assets/logoTrans.png',
                  rating: '4.5',
                  distance: '500m away',
                  tapped: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const SingleSearchScreen()),
                      ),
                    );
                  },
                ),
                SearchDisplayCard(
                  name: 'Ali Muhammed',
                  imageUrl: 'lib/assets/logoTrans.png',
                  rating: '4.5',
                  distance: '500m away',
                  tapped: () {},
                ),
                SearchDisplayCard(
                  name: 'Ali Muhammed',
                  imageUrl: 'lib/assets/logoTrans.png',
                  rating: '4.5',
                  distance: '500m away',
                  tapped: () {},
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
