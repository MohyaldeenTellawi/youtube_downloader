import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class AddScreenBody extends StatelessWidget {
  const AddScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextFromField(),
      ],
    );
  }
}
