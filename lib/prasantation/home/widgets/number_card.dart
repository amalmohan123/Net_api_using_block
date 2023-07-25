import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index,required this.imageUrl});
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 150,
              width: 50,
            ),
            Container(
              width: 140,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: -27,
          child: BorderedText(
            strokeWidth: 7,
            strokeColor: const Color.fromARGB(255, 196, 196, 196),
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                fontSize: 130,
                color: blackColor,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
