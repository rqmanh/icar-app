import 'package:go_router/go_router.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_keys.dart';
import 'package:icar/config/routre/app_routes.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/widgets/buttons/back_button.dart';
import 'package:icar/core/widgets/buttons/buttons.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';


class ConfirmationSheet extends StatelessWidget {
  final String desc;
  final String buttonTitle;
  final Function() onTap;

  const ConfirmationSheet(
      {super.key,
      required this.desc,
      required this.buttonTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: const ShapeDecoration(
            shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius.only(
                    topLeft:
                        SmoothRadius(cornerRadius: 30, cornerSmoothing: 1.0),
                    topRight:
                        SmoothRadius(cornerRadius: 30, cornerSmoothing: 1.0))),
            color: CColors.cardBackgroundColor
          ),
          padding: const EdgeInsets.all(25),
          child: SafeArea(
            
            top: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Spacer(),
                    XMarkButton(),
                  ],
                ),
                Text(AppKeys.areYouSure,
                    style: CTextStyles.font18WhiteMedium),
                const SizedBox(height: 15),
                Text(desc, style: CTextStyles.font14LightGrayRegular),
                const SizedBox(height: 40),
                CommonSheetButton(
                  color: CColors.red,
                  title: buttonTitle,
                  onTap: () {
                 context.pop();
                    onTap();
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
