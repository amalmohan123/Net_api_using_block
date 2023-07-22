import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors.dart';
import 'package:netflix_api/prasantation/downloads/screen_downloads.dart';
import 'package:netflix_api/prasantation/home/screen_home.dart';
import 'package:netflix_api/prasantation/main_page/widgets/bottom_nav.dart';
import '../fast_laugh/screen_fast_laugh.dart';
import '../new_and_hot/screen_new_and_hot.dart';
import '../search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
     const ScreenFastLaughs(),
     ScreenSearch(),
   ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgrountcolor,
        body: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: indexChageNotifier,
            builder: (context, int intex, _) {
              return _pages[intex];
            },
          ),
        ),
        bottomNavigationBar: const BottomNavWidgets());
  }
}
