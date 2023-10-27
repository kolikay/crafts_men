import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_appbar.dart';
import 'package:craftsmen/screens/auth/views/login_screen.dart';
import 'package:craftsmen/screens/search/displayAllsearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'crafts_homepage_constant_widgets.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  static const id = 'catsearchscreen';
  const CategoriesPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    // final notes = ref.watch(noteViewModelProvider);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: kMainColor,
              height: 103.h,
              width: 375.w,
              child: ReuseableAppbar(
                color: Colors.white,
                appBarTitle: 'Categories',
                firstAppIcon: Icons.arrow_back_ios,
                secondAppIcon: Icons.search,
                firstButton: () {
                  Navigator.pop(context);
                },
                secondButton: () {},
              ),
            ),
            Expanded(
              child: Container(
                color: kDarkContainer,
                child: GridView.count(
                    primary: false,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    crossAxisCount: 3,
                    children: <Widget>[
                      HomeConstants.categoryCard(
                          context, 'Plumbers', 'lib/assets/plumber.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'Plumbers',
                                )),
                          ),
                        );
                      }),
                      HomeConstants.categoryCard(context, 'Painters',
                          'lib/assets/painter.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'Painters',
                                )),
                          ),
                        );
                      }),
                      HomeConstants.categoryCard(
                          context, 'Electricians', 'lib/assets/electrician.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'Electricians',
                                )),
                          ),
                        );
                      }),
                      HomeConstants.categoryCard(
                          context, 'Barbers', 'lib/assets/Barber.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'Barbers',
                                )),
                          ),
                        );
                      }),
                      HomeConstants.categoryCard(
                          context, 'Engineer', 'lib/assets/engineer.png',
                          () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'Engineere',
                                )),
                          ),
                        );
                      }),
                      HomeConstants.categoryCard(context, 'Health Workers',
                          'lib/assets/health.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'Health Workers',
                                )),
                          ),
                        );
                      }),
                      HomeConstants.categoryCard(
                          context, 'Carpenters', 'lib/assets/carpenter.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'Carpenters',
                                )),
                          ),
                        );
                      }),
                      HomeConstants.categoryCard(context, 'Hair Stylist',
                          'lib/assets/carpenter.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'Hair Stylist',
                                )),
                          ),
                        );
                      }),
                      HomeConstants.categoryCard(
                          context, 'Developers', 'lib/assets/carpenter.png',
                          () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const DisplayAllSearchScreen(
                                  service: 'Developers',
                                )),
                          ),
                        );
                      }),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
