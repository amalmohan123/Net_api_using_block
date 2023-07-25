import 'package:flutter/material.dart';
import 'package:netflix_api/core/constants.dart';
import 'package:netflix_api/prasantation/new_and_hot/widgets/video_widget.dart';

import '../../widgets/icon_with_text.dart';


class EveryonesWatching extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryonesWatching({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        khight,
        Text(
          movieName,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'Robobo',
              letterSpacing: 1.2),
        ),
        khight,
        Text(
          description, 
          maxLines: 6,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(
          height: 35,
        ),
        VideoWidget(posterPath, key),
        khight,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:  [
            IconWithText(
              icon: Icons.share,
              text: 'Share',
              textSize: 15,
              iconSize: 32,
            ),
            kwidth,
            IconWithText(
              icon: Icons.add,
              text: 'My List',
              textSize: 15,
              iconSize: 32,
            ),
          kwidth,
          IconWithText(
              icon: Icons.play_arrow,
              text: 'Play',
              textSize: 15,
              iconSize: 32,
            ),
           kwidth,
          ],
        )
      ]),
    );
  }
}
