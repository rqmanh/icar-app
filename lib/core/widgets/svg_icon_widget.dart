
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icar/config/app_colors.dart';

class CirclarSvgIconWidget extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  final void Function()? onTap;

  const CirclarSvgIconWidget({
    super.key,
    required this.path,
    this.width = 30,
    this.height = 30,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: CColors.white,
          border: Border.all(color: CColors.borderColor),
          shape: BoxShape.circle,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.03),
          //     blurRadius: 30,
          //     spreadRadius: 0,
          //     offset: const Offset(0, 10),
          //   ),
          // ],
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: SvgPicture.asset(
            path,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
class SvgIconWidget extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  final Color color;
  
  final void Function()? onTap;

  const SvgIconWidget(
      {super.key,
      required this.path,
      this.width = 20,
      this.height = 30,
      this.onTap,  this.color=CColors.borderColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: SvgPicture.asset(
          path,
          width: width,
          height: height,
        ),
      ),
    );
  }
}


