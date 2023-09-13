import 'package:flutter/material.dart';

import '../widgets/custom_explore_video_list_view.dart';

class ExploreScreenView extends StatelessWidget {
  const ExploreScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomScrollView(
      slivers: [ExploreVideoListView()],
    ));
  }
}
