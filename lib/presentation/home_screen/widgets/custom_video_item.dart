import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:youtube/models/data.dart';
import 'package:youtube/presentation/main_screen/view/main_screen_view.dart';
import 'package:youtube/presentation/video_screen/view/video_screen_view.dart';

import 'Custom_Stack_Video_item.dart';
import 'custom_details_video_row.dart';

class CustomVideoItem extends ConsumerWidget {
  const CustomVideoItem({super.key, required this.video});
  final Video video;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(selectedVideoProvider.notifier).state = video;
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const VideoScreenView();
        }));
      },
      child: Column(
        children: [
          CustomStackVideoitem(
            video: video,
          ),
          CustomDetailsVideoRow(video: video)
        ],
      ),
    );
  }
}
