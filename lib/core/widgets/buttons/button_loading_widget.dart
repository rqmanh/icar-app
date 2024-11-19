// import 'package:icar/config/app_strings.dart';
import 'package:flutter/material.dart';

class ButtonLoadingWidget extends StatelessWidget {
  final Color circularColor;
  const ButtonLoadingWidget({super.key, this.circularColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(color: circularColor),
        ),
        const SizedBox(width: 10),
        // Text(AppTexts.loading)
      ],
    );
  }
}
