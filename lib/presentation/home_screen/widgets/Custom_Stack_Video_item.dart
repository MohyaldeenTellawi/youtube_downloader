import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';
import '../../../models/data.dart';

class CustomStackVideoitem extends StatelessWidget {
  const CustomStackVideoitem({super.key, required this.video});

  final Video video;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          video.thumbnailUrl,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          right: 8,
          bottom: 8,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              video.duration,
              style: durationStyle,
            ),
          ),
        ),
      ],
    );
  }
}
