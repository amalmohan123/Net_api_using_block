import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors.dart';

class CustomButtonWidgets extends StatelessWidget {
  const CustomButtonWidgets({
    super.key,
    required this.title,
    required this.icon,
    this.iconSize = 30,
    this.textSize = 18,
  });
  final String title;
  final IconData icon;
  final double iconSize;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: whiteColor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: textSize,
          ),
        ),
      ],
    );
  }
}
