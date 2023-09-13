import 'package:flutter/material.dart';
import 'package:youtube/models/data.dart';
import 'package:youtube/presentation/home_screen/widgets/custom_video_item.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 8),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final video = videos[index];
          return CustomVideoItem(video: video);
        }, childCount: videos.length),
      ),
    );
  }
}
