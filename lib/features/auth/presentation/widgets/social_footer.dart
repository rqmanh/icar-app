import 'package:easy_localization/easy_localization.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_icons.dart';
import 'package:icar/core/widgets/buttons/clickable_richtext_widget.dart';

import 'package:icar/config/app_sizes.dart';
import 'package:icar/config/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:icar/core/widgets/buttons/social_button.dart';

class SocialFooter extends StatelessWidget {
  const SocialFooter({
    super.key,
    this.text1 = tDontHaveAnAccount,
    this.text2 = signup,
    required this.onPressed,
  });

  final String text1, text2;
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
              text: '${tConnectWith.tr()} ${tGoogle.tr()}',
              isLoading: false,
              onPressed: () {}),
          const SizedBox(height: 10),
          TSocialButton(
              image: AppIcons.appleLogo,
              foreground: CColors.black,
              background: CColors.white,
              text: '${tConnectWith.tr()} ${tApple.tr()}',
              isLoading: false,
              onPressed: () {}),
          const SizedBox(height: tDefaultSpace * 2),
          ClickableRichTextWidget(
            text1: text1.tr(),
            text2: text2.tr(),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
