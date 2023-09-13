import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube/models/data.dart';
import 'package:youtube/models/reels_data.dart';
import 'package:youtube/presentation/add_screen/view/add_screen_view.dart';
import 'package:youtube/presentation/explore_screen/view/explore_screen_view.dart';
import 'package:youtube/presentation/home_screen/view/home_screen_view.dart';
import 'package:youtube/presentation/main_screen/widgets/bottom_nav_bar.dart';

final selectedVideoProvider = StateProvider<Video?>((ref) => null);
final selectedReelsProvider = StateProvider<Reels?>((ref) => null);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final screens = [
    const HomeScreenView(),
    const ExploreScreenView(),
    const AddScreenView(),
    const Scaffold(
      body: Center(
        child: Text('subscriptions'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('library'),
      ),
    ),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: screens
              .asMap()
              .map((index, screen) => MapEntry(
                  index,
                  Offstage(
                    offstage: selectedIndex != index,
                    child: screen,
                  )))
              .values
              .toList()),
      bottomNavigationBar: CistomBottonNavBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
