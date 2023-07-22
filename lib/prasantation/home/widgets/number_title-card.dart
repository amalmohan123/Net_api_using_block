import 'package:flutter/material.dart';
import 'package:netflix_api/core/constants.dart';
import 'package:netflix_api/prasantation/home/widgets/number_card.dart';
import 'package:netflix_api/prasantation/widgets/main_tittle.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTittle(
          title: 'Top 10 Tv Shows In Inadia Today',
        ),
        khight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) {
                return NumberCard(
                  index: index,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
