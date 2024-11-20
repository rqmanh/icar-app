import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_icons.dart';
import 'package:icar/config/app_keys.dart';
import 'package:icar/core/widgets/buttons/clickable_richtext_widget.dart';

import 'package:icar/config/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:icar/core/widgets/buttons/social_button.dart';

class SocialFooter extends StatelessWidget {
  const SocialFooter({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: tDefaultSpace * 1.5, bottom: tDefaultSpace),
      child: Column(
        children: [
          TSocialButton(
              image: AppIcons.googleLogo,
              foreground: CColors.black,
              background: CColors.white,
              text: '${AppKeys.connectWith} ${AppKeys.google}',
              isLoading: false,
              onPressed: () {}),
          const SizedBox(height: 10),
          TSocialButton(
              image: AppIcons.appleLogo,
              foreground: CColors.black,
              background: CColors.white,
              text: '${AppKeys.connectWith} ${AppKeys.apple}',
              isLoading: false,
              onPressed: () {}),
          const SizedBox(height: tDefaultSpace * 2),
          ClickableRichTextWidget(
            text1: AppKeys.dontHaveAnAccount,
            text2: AppKeys.signup,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
