import 'package:flutter/material.dart';
import 'package:youtube/presentation/reel_video_screen/widgets/reel_video_screen_body.dart';

class ReelVideoScreenView extends StatelessWidget {
  const ReelVideoScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ReelVideoScreenBody(),
    );
  }
}
