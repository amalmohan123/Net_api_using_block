import 'package:flutter/material.dart';



class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:8),
      width: 140,
      height: 290,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/screen_downoad/pic 3.jpg"),
    
        ),
      ),
    
    );
    
  }
}
