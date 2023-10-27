// ignore_for_file: use_build_context_synchronously

import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusesable_appBar2.dart';
import 'package:craftsmen/constants/reusesable_widgets/searchDisplayCards.dart';
import 'package:craftsmen/constants/utils/progress_bar.dart';
import 'package:craftsmen/constants/utils/snack_bar.dart';
import 'package:craftsmen/models/skillProvider_models.dart';
import 'package:craftsmen/screens/auth/auth_view_models/auth_view_model.dart';
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

@override
void initState() {
  WidgetsBinding.instance.addPostFrameCallback((_) {});
}

class _DisplayAllSearchScreenState
    extends ConsumerState<DisplayAllSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    final searchResultProvider = ref.watch(searchProvider);
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
          body: FutureBuilder<List<SkillProviderModel>>(
              future: searchResultProvider.searchSkills(widget.service),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.done) {
                  if (snap.data!.isEmpty) {
               
                  }
                  return ListView.builder(
                      itemCount: searchResultProvider.allCraftmen.length,
                      itemBuilder: (context, index) {
                        return SearchDisplayCard(
                          name:
                              searchResultProvider.allCraftmen[index].fullName!,
                          imageUrl: searchResultProvider
                                      .allCraftmen[index].profilePic ==
                                  ''
                              ? 'https://st2.depositphotos.com/4520249/7558/v/450/depositphotos_75585915-stock-illustration-construction-worker-icon.jpg'
                              : searchResultProvider
                                  .allCraftmen[index].profilePic!,
                          rating: '4.5',
                          distance: snap.data![index].email!,
                          tapped: () async {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: ((context) => SingleSearchScreen(
                                      craftManDetails: searchResultProvider
                                          .allCraftmen[index],
                                    )),
                              ),
                            );
                          },
                        );
                      });
                } else if (snap.hasError) {
                  return ShowSnackBar.buildErrorSnackbar(
                      context, 'message', Colors.red);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
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
