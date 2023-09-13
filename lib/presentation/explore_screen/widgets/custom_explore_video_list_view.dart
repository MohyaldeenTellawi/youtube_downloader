import 'package:flutter/material.dart';
import 'package:youtube/models/reels_data.dart';

import 'custom_stack_video_explore_item.dart';

class ExploreVideoListView extends StatelessWidget {
  const ExploreVideoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 1),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final reel = reels[index];
          return CustomStackVideoExploreitem(
            reels: reel,
          );
        }, childCount: reels.length),
      ),
    );
  }
}
