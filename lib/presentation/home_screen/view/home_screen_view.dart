import 'package:flutter/material.dart';
import 'package:youtube/presentation/home_screen/widgets/custom_list_view.dart';

import '../widgets/custom_sliver_app_bar.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [CustomAppBar(), CustomListView()],
      ),
    );
  }
}
