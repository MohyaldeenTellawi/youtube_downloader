import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:youtube/presentation/main_screen/view/main_screen_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreenBody extends ConsumerWidget {
  const VideoScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, watch, _) {
      YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId:
              convertedUrl(ref.read(selectedVideoProvider.notifier).state!.id),
          flags: const YoutubePlayerFlags(mute: false));

      return Container(
        color: Colors.black,
        child: Center(
          child: YoutubePlayerBuilder(
            builder: (context, player) {
              return YoutubePlayer(controller: controller);
            },
            player: YoutubePlayer(controller: controller),
          ),
        ),
      );
    });
  }

  String convertedUrl(url) {
    return YoutubePlayer.convertUrlToId(url).toString();
  }
}
