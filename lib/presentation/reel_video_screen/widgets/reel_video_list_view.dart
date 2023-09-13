import 'package:flutter/material.dart';
import 'package:youtube/presentation/reel_video_screen/widgets/reel_video_screen_body.dart';

import '../../../models/reels_data.dart';

class ReelVideoListVideo extends StatelessWidget {
  const ReelVideoListVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 8),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return const ReelVideoScreenBody();
        }, childCount: reels.length),
      ),
    );
  }
}
