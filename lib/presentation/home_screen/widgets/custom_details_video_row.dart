import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube/core/utils/styles.dart';
import '../../../models/data.dart';
import 'custom_icon_button.dart';

class CustomDetailsVideoRow extends StatefulWidget {
  const CustomDetailsVideoRow({super.key, required this.video});

  final Video video;

  @override
  State<CustomDetailsVideoRow> createState() => _CustomDetailsVideoRowState();
}

class _CustomDetailsVideoRowState extends State<CustomDetailsVideoRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(widget.video.channelImageUrl),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    widget.video.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Text(
                    '${widget.video.channelName} | ${widget.video.viewCount} | ${timeago.format(widget.video.timestamp)}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          CustomActionIconButton(
              iconSize: 20,
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                showAdaptiveDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) {
                      return CustomAdaptiveDialog(
                          videoUrl: widget.video.videoUrl,
                          onPressed: () {
                            copyLink();
                          });
                    });
              })
        ],
      ),
    );
  }

  void copyLink() {
    FlutterClipboard.copy(widget.video.videoUrl)
        .then((value) => print('Copyid'));
    Navigator.of(context).pop();
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
