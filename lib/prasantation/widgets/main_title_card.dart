import 'package:flutter/material.dart';
import 'package:netflix_api/prasantation/widgets/main_tittle.dart';
import '../../core/constants.dart';
import 'main_card.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title,
    required this.posterList,
  });
  final String title;
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTittle(
          title: title,
        ),
        khight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(posterList.length, (index) {
              return MainCard(imageUrl: posterList[index]);
            }),
          ),
        ),
      ],
    );
  }
}
