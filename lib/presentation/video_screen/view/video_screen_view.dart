import 'package:flutter/material.dart';

import '../widgets/video_screen_body.dart';

class VideoScreenView extends StatelessWidget {
  const VideoScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VideoScreenBody(),
    );
  }
}
