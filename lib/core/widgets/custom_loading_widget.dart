import 'package:icar/config/app_images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottieLoading extends StatelessWidget {
  final double width;
  final double height;

  const CustomLottieLoading({
    super.key,
    this.width = 150.0,
    this.height = 150.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        repeat: true,
        AppImages.loading,
        width: width,
        height: height,
      ),
    );
  }
}
