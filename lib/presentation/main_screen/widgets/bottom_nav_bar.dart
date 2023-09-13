// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CistomBottonNavBar extends StatelessWidget {
  const CistomBottonNavBar({
    Key? key,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  final void Function(int) onTap;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
          activeIcon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          label: 'Shorts',
          activeIcon: Icon(Icons.explore),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'add',
          activeIcon: Icon(Icons.add_circle),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.subscriptions_outlined),
          label: 'subscriptions',
          activeIcon: Icon(Icons.subscriptions),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_library_outlined),
          label: 'library',
          activeIcon: Icon(Icons.video_library),
        ),
      ],
    );
  }
}
