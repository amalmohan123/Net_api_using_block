import 'package:flutter/material.dart';
import 'package:netflix_api/prasantation/home/screen_home.dart';
import 'package:netflix_api/prasantation/home/widgets/my_list_widgets.dart';

import '../../../core/colors.dart';

class BackGroundCard extends StatelessWidget {
  const BackGroundCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 650,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(mainImage),
            ),
          ),
        ),
         const Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButtonWidgets(title: 'My List',icon: Icons.add,),
              _PlayButton(),
              CustomButtonWidgets( icon: Icons.info_outline,title: 'Info',)

            ],
          ),
        ),
      ],
    );
  }
}
class _PlayButton extends StatelessWidget {
  const _PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(whiteColor),
      ),
      icon: const Icon(
        Icons.play_arrow,
        size: 25, 
        color: blackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 20, color: blackColor),
        ),
      ),
    );
  }
}
