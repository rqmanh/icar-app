
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/core/widgets/buttons/circle_button.dart';

class XmarkButton extends StatelessWidget {
  final Function onTap;

  const XmarkButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const CircleIcon(color: CColors.black, iconData: Icons.close),
      onTap: () {
        context.pop();
        onTap();
      },
    );
  }
}
