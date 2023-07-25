import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String imageUrl;

  const MainCard({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 140,
      height: 290,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image:  DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
