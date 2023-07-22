import 'package:flutter/material.dart';

ValueNotifier<int> indexChageNotifier = ValueNotifier(0);

class BottomNavWidgets extends StatelessWidget {
  const BottomNavWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChageNotifier,
      builder: (context, int newIndex, _) => BottomNavigationBar(
        currentIndex: newIndex,
        onTap: (index) {
          indexChageNotifier.value = index;
        },
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.collections,
              ),
              label: 'New & Hot'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.emoji_emotions,
              ),
              label: 'Fast Laughs'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.download,
              ),
              label: 'Downloads'),
        ],
      ),
    );
  }
}
