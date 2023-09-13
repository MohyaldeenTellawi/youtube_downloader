import 'package:flutter/material.dart';

class CustomActionIconButton extends StatelessWidget {
  const CustomActionIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconSize,
  });

  final Widget icon;
  final void Function() onPressed;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return IconButton(iconSize: iconSize, onPressed: onPressed, icon: icon);
  }
}
