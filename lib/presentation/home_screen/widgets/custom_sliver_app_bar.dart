import 'package:flutter/material.dart';

import '../../../constant.dart';
import 'custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leadingWidth: 100,
      leading: Image.asset(logo),
      actions: [
        CustomActionIconButton(icon: const Icon(Icons.cast), onPressed: () {}),
        CustomActionIconButton(
            icon: const Icon(Icons.notifications_outlined), onPressed: () {}),
        CustomActionIconButton(
            icon: const Icon(Icons.search_outlined), onPressed: () {}),
        CustomActionIconButton(
            iconSize: 40,
            icon: const CircleAvatar(
              foregroundImage: AssetImage(
                profile,
              ),
            ),
            onPressed: () {}),
      ],
    );
  }
}
