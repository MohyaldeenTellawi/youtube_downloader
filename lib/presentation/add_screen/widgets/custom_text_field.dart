import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:youtube/constant.dart';
import 'package:youtube/core/utils/styles.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:timeago/timeago.dart' as timeago;

class CustomTextFromField extends StatefulWidget {
  const CustomTextFromField({super.key, this.video});

  final Video? video;
  @override
  State<CustomTextFromField> createState() => _CustomTextFromFieldState();
}

class _CustomTextFromFieldState extends State<CustomTextFromField> {
  final TextEditingController controller = TextEditingController();
  String videoTitle = '';
  String videoPuplishDate = '';
  String videoID = '';
  bool isDownloading = false;
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(16)),
          width: double.infinity,
          child: TextFormField(
            autocorrect: false,
            cursorColor: Colors.black,
            keyboardType: TextInputType.url,
            onTapOutside: (_) {
              FocusScope.of(context).unfocus();
            },
            controller: controller,
            onChanged: (val) {
              getVideoTitle(val);
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      videoTitle = '';
                      videoPuplishDate = '';
                      videoID = '';
                      controller.text = '';
                    });
                  },
                  icon: const Icon(Icons.delete_sweep)),
              hintText: 'paste video url here...',
              hintStyle: hintStyle,
              hintTextDirection: TextDirection.ltr,
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        const SizedBox(height: 10),
        videoID != ''
            ? Image.network(
                'https://img.youtube.com/vi/$videoID/0.jpg',
                height: 180,
              )
            : Image.asset(logo),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            videoTitle,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(videoPuplishDate),
        ),
        OutlinedButton.icon(
          onPressed: () {
            downloadVideo(controller.text);
          },
          icon: const Icon(
            Icons.download_sharp,
            color: Colors.blueGrey,
          ),
          label: const Text(
            'Download Video',
            style: buttomStyle,
          ),
        ),
        isDownloading
            ? Padding(
                padding: const EdgeInsets.all(5),
                child: LinearProgressIndicator(
                  value: progress,
                  color: Colors.blueGrey,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.teal),
                ),
              )
            : Container()
      ],
    );
  }

  Future<void> getVideoTitle(url) async {
    var youtubeInfo = YoutubeExplode();
    var video = await youtubeInfo.videos.get(url);
    setState(() {
      videoTitle = video.title;
      videoPuplishDate = timeago.format(video.publishDate!).toString();
      videoID = video.id.toString();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          'Link has been copied successfully',
          style: snackBarStyle,
        )),
      );
    });
  }

  Future<void> downloadVideo(id) async {
    var permission = await Permission.storage.request();
    if (permission.isGranted) {
      //download video
      setState(() {
        isDownloading = true;
      });
      if (controller.text != '') {
        //download video
        setState(() {
          progress = 0;
        });
        var _youtubeExplode = YoutubeExplode();
        //get video meatadata
        var video = await _youtubeExplode.videos.get(id);
        var mainfest =
            await _youtubeExplode.videos.streamsClient.getManifest(id);
        var stream = mainfest.muxed.withHighestBitrate();
        var audio = stream;
        var audioStream = _youtubeExplode.videos.streamsClient.get(audio);
        //creat a path
        Directory appDocDir = await getApplicationDocumentsDirectory();
        String appDocPath = appDocDir.path;
        var file = File('$appDocPath/${video.id}');
        //delete video
        if (file.existsSync()) {
          file.deleteSync();
        }
        var output = file.openWrite(mode: FileMode.writeOnlyAppend);
        var size = audio.size.totalBytes;
        var count = 0;
        await for (final data in audioStream) {
          count += data.length;
          double val = ((count / size));
          var msg = '${video.title} Downloaded to $appDocPath/${video.id}';
          for (val; val == 1; val++) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  msg,
                  style: snackBarStyle.copyWith(color: Colors.teal),
                ),
              ),
            );
          }
          setState(() {
            progress = val;
          });
          output.add(data);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'No link has copied',
          style: snackBarStyle.copyWith(color: Colors.redAccent),
        )));
        setState(() {
          isDownloading = false;
        });
      }
    } else {
      await Permission.storage.request();
    }
  }
}
