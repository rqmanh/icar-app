
import 'package:flutter/material.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_keys.dart';
import 'package:icar/core/localization/local_keys.dart';
import 'package:icar/core/utils/app_utils.dart';


class TFormDividerWidget extends StatelessWidget {
  const TFormDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = AppUtils.isDarkMode(context);
    // MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Row(
      children: [
        Flexible(
            child: Divider(
                thickness: 1,
                indent: 50,
                color: Colors.grey.withOpacity(0.3),
                endIndent: 10)),
        Text(AppKeys.or,
            style: Theme.of(context).textTheme.bodyLarge!.apply(
                color: isDark
                    ? CColors.white.withOpacity(0.5)
                    : CColors.black.withOpacity(0.5))),
        Flexible(
            child: Divider(
                thickness: 1,
                indent: 10,
                color: Colors.grey.withOpacity(0.3),
                endIndent: 50)),
      ],
    );
  }
}
