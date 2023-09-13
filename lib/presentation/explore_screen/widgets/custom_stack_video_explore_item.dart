import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube/models/reels_data.dart';
import 'package:youtube/presentation/reel_video_screen/view/reel_video_screen_view.dart';

import '../../../core/utils/styles.dart';
import '../../home_screen/widgets/custom_icon_button.dart';
import '../../main_screen/view/main_screen_view.dart';

class CustomStackVideoExploreitem extends ConsumerWidget {
  const CustomStackVideoExploreitem({super.key, required this.reels});

  final Reels reels;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(selectedReelsProvider.notifier).state = reels;
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const ReelVideoScreenView();
        }));
      },
      child: Stack(
        children: [
          Image.network(
            reels.thumbnailUrl,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            right: 8,
            bottom: 125,
            child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CustomRowIcomCopy(
                  reels: reels,
                )),
          ),
        ],
      ),
    );
  }

  void copyLink() {
    FlutterClipboard.copy(reels.videoUrl).then((value) => print('Copyid'));
  }
}

class CustomRowIcomCopy extends StatefulWidget {
  const CustomRowIcomCopy({super.key, required this.reels});
  final Reels reels;

  @override
  State<CustomRowIcomCopy> createState() => _CustomRowIcomCopyState();
}

class _CustomRowIcomCopyState extends State<CustomRowIcomCopy> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              showAdaptiveDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return CustomAdaptiveDialog(
                        videoUrl: widget.reels.videoUrl,
                        onPressed: () {
                          FlutterClipboard.copy(widget.reels.videoUrl)
                              .then((value) => print('Copyid'));
                        });
                  });
            },
            icon: const Icon(Icons.more))
      ],
    );
  }
}

class CustomAdaptiveDialog extends StatelessWidget {
  const CustomAdaptiveDialog(
      {super.key, required this.videoUrl, required this.onPressed});

  final String videoUrl;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      content: Text(
        videoUrl,
        style: snackBarStyle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        CustomActionIconButton(
            icon: const Icon(Icons.copy), onPressed: onPressed)
      ],
    );
  }
}
