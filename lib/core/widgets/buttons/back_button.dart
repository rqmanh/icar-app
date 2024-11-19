import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:icar/config/app_colors.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: const Icon(
        Icons.chevron_left_rounded,
        color: CColors.black,
      ),
    );
  }
}

class XMarkButton extends StatelessWidget {
  const XMarkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: CircleAvatar(
        radius: 15,
        backgroundColor: CColors.white.withOpacity(0.1),
        foregroundColor: CColors.white.withOpacity(0.5),
        child: const Icon(Icons.close_rounded, size: 18),
      ),
    );
  }
}

class VerifyIcon extends StatelessWidget {
  final bool isVerified;

  const VerifyIcon({super.key, required this.isVerified});

  @override
  Widget build(BuildContext context) {
    if (isVerified) {
      return Row(
        children: [const SizedBox(width: 5), verifiedIcon()],
      );
    } else {
      return const SizedBox();
    }
  }
}

Widget verifiedIcon() {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        color: CColors.primaryColor,
        width: 12,
        height: 12,
      ),
      RotationTransition(
        turns: const AlwaysStoppedAnimation(45 / 360),
        child: Container(
          color: CColors.primaryColor,
          width: 12,
          height: 12,
        ),
      ),
      Text(
        String.fromCharCode(CupertinoIcons.checkmark_alt.codePoint),
        style: TextStyle(
          inherit: false,
          color: CColors.white,
          fontSize: 10.0,
          fontWeight: FontWeight.w700,
          fontFamily: CupertinoIcons.exclamationmark_circle.fontFamily,
          package: CupertinoIcons.exclamationmark_circle.fontPackage,
        ),
      )
    ],
  );
}
// }
