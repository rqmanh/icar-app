import 'package:icar/app.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/utils/shared_pref_helper.dart';
import 'package:icar/core/widgets/custom_asset_image_widget.dart';
import 'package:icar/config/app_colors.dart';
import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.11,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  // Variables -- Declared in Constructor
  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final String image, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: PrefHelper.instance.getLangCode() == 'ar'
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: CustomAssetImageWidget(image,
                color: CColors.primaryColor, height: size.height * imageHeight),
          ),
          //  SvgPicture.asset(image, color: imageColor, height: size.height * imageHeight+200 ),
          SizedBox(height: heightBetween ?? 20),
          Text(title,
              style: CTextStyles.font24BlackBold.copyWith(fontSize: 20)),
          SizedBox(height: heightBetween ?? 10),
          Text(
            subTitle,
            // textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: CColors.secondaryTextColor,
                ),
          )
        ],
      ),
    );
  }
}
