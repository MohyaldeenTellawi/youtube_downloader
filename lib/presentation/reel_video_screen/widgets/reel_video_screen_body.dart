import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:youtube/presentation/main_screen/view/main_screen_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ReelVideoScreenBody extends ConsumerWidget {
  const ReelVideoScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, watch, _) {
      YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId:
              convertedUrl(ref.read(selectedReelsProvider.notifier).state!.id),
          flags: const YoutubePlayerFlags(mute: false, autoPlay: true));

      return Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: YoutubePlayerBuilder(
              builder: (context, player) {
                return YoutubePlayer(controller: controller);
              },
              player: YoutubePlayer(controller: controller),
            ),
          ),
        ],
      );
    });
  }

  String convertedUrl(url) {
    return YoutubePlayer.convertUrlToId(url).toString();
  }
}
