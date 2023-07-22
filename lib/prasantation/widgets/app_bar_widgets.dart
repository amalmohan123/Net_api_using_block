import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenAppBarWidget extends StatelessWidget {
  const ScreenAppBarWidget({super.key,required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        Text(
          title,
          style: GoogleFonts.montserrat(fontSize: 28,fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
        ),
        SizedBox(width: 15),
        Container(
          height: 25,
          width: 25,
          color: Colors.blue,
        ),
        SizedBox(width: 15)
      ],
    );
  }
}
