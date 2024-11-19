import 'package:easy_localization/easy_localization.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';


class CommonButton extends StatelessWidget {
  final String text;
  final Function onTap;

  const CommonButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: ShapeDecoration(
            color: CColors.primaryColor,
            shape: const SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius.all(
                    SmoothRadius(cornerRadius: 12, cornerSmoothing: 1.0))),
            shadows: kMyBoxShadow,
          ),
          padding: const EdgeInsets.symmetric(vertical: 18),
          margin: const EdgeInsets.only(bottom: 15, right: 10, left: 10),
          alignment: Alignment.center,
          width: double.infinity,
          child: Text(text.tr(), style: CTextStyles.font18WhiteSemiBold),
        ),
      ),
    );
  }
}

class CommonSheetButton extends StatelessWidget {
  final Color? color;
  final String title;
  final VoidCallback onTap;

  const CommonSheetButton(
      {super.key, required this.title, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 30),
        decoration: ShapeDecoration(
            shape: const SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius.all(
                    SmoothRadius(cornerRadius: 12, cornerSmoothing: 1.0))),
            color: color ?? CColors.primaryColor),
        height: 50,
        width: double.infinity,
        child: Text(title.tr(), style: CTextStyles.font16WhiteBold),
      ),
    );
  }
}

var kMyBoxShadow = [
  BoxShadow(
    color: CColors.primaryColor.withOpacity(0.5),
    blurRadius: 10,
    offset: const Offset(0, 4), // Shadow position
  )
];
Widget buildIconButton( IconData icon,
    {void Function()? onPressed,
    Color color = const Color(0xFF434456),
    Color iconColor = const Color(0xFFE7EBEA),
    double size=25}) {
  return Container(
    width: size +20,
    height: size+20,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: CColors.scafBackgroundColorDark,
      border: Border.all(color: color),
    ),
    child: IconButton(
      icon: Icon(size: size, icon, color: iconColor),
      onPressed: onPressed,
    ),
  );
}
