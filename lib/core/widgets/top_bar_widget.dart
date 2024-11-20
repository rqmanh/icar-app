
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/theme/app_text_styles.dart';


class TopBarForInView extends StatelessWidget {
  final String title;
  final Widget? child;
  final Widget? verticalChild;
  final IconData? backIcon;
  final double size;

  const TopBarForInView(
      {super.key,
      required this.title,
      this.child,
      this.verticalChild,
      this.backIcon,
      this.size = 35});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: CColors.backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            GestureDetector(
              child: Icon(
                backIcon ?? Icons.chevron_left_rounded,
                color: CColors.white,
                size: size,
              ),
              onTap: () {
               context.pop();
              },
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(title, style: CTextStyles.font18WhiteMedium),
                  SizedBox(
                    height: verticalChild == null ? 0 : 5,
                  ),
                  verticalChild ?? Container()
                ],
              ),
            ),
            child ?? Container()
          ],
        ),
      ),
    );
  }
}
