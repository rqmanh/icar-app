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
    this.imageHeight = 0.15,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAssetImageWidget(image,
              color: CColors.primaryColor,
              height: size.height * imageHeight + 50),
          //  SvgPicture.asset(image, color: imageColor, height: size.height * imageHeight+200 ),
          SizedBox(height: heightBetween ?? 20),
          Text(title, style: Theme.of(context).textTheme.displayLarge),
          SizedBox(height: heightBetween ?? 10),
          Text(subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}