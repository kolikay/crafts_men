// ignore_for_file: use_build_context_synchronously

import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusesable_appBar2.dart';
import 'package:craftsmen/constants/reusesable_widgets/searchDisplayCards.dart';
import 'package:craftsmen/constants/utils/progress_bar.dart';
import 'package:craftsmen/screens/search/singleSearchDisplayScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayAllSearchScreen extends ConsumerStatefulWidget {
  const DisplayAllSearchScreen({Key? key, required this.service})
      : super(key: key);
  final String service;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DisplayAllSearchScreenState();
}

class _DisplayAllSearchScreenState
    extends ConsumerState<DisplayAllSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(103.h),
            child: ReusesableAppBar2(
              appBarTitle: 'Nearby ${widget.service}',
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
                    tapped: () async {
                      await authViewModel.request();

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
                    distance: '3 KM away',
                    tapped: () async {
                      await authViewModel.request();

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
                    distance: '1 KM away',
                    tapped: () async {
                      await authViewModel.request();

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => const SingleSearchScreen()),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
        ),
        Positioned(
          child: authViewModel.loading
              ? const Center(
                  child: ProgressDialog(
                    message: 'Loading....',
                  ),
                )
              : const SizedBox(),
        ),
      ]),
    );
  }
}
