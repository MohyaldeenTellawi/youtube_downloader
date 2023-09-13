import 'package:flutter/material.dart';

import '../widgets/add_screen_body.dart';

class AddScreenView extends StatelessWidget {
  const AddScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddScreenBody(),
    );
  }
}
