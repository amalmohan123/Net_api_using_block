import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:netflix_api/core/constants.dart';
import 'package:netflix_api/prasantation/home/widgets/background_card.dart';

import '../widgets/main_title_card.dart';
import 'widgets/number_title-card.dart';

const mainImage = 'assets/images/home_screen/pic-7.jpg';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: const [
                    BackGroundCard(),
                    khight,
                    MainTitleCard(title: 'Released in the Past Year'),
                    khight,
                    MainTitleCard(title: 'Trending Now'),
                 khight,
                    NumberTitleCard(),
                    khight,
                    MainTitleCard(title: 'Tense Dramas'),
                    khight,
                    MainTitleCard(title: 'South Indian Cinema'),
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.1),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/home_screen/logo.png',
                                  height: 60,
                                  width: 60,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                ),
                            const    SizedBox(width: 15),
                                Container(
                                  height: 25,
                                  width: 25,
                                  color: Colors.blue,
                                ),
                              const  SizedBox(width: 15),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('TV Shows',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                Text('Movies',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                Text('Categories',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                              ],
                            )
                          ],
                        ),
                      )
                    : khight
              ],
            ),
          );
        },
      ),
    );
  }
}
