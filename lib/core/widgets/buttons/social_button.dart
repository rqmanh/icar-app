import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'button_loading_widget.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton({
    super.key,
    required this.text,
    required this.image,
    this.isLoading = false,
    this.loadingColor = Colors.white,
    required this.foreground,
    required this.background,
    required this.onPressed,
  });

  final String text;
  final String image;
  final Color foreground, background;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color loadingColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 1,
          foregroundColor: foreground,
          backgroundColor: background,
          side: BorderSide.none,
          padding: EdgeInsets.zero
        ),
        icon: isLoading
            ? const SizedBox()
            : SvgPicture.asset(image, width: 24, height: 24),
        label: isLoading
            ? ButtonLoadingWidget(circularColor: loadingColor)
            : Text(text,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: foreground)),
      ),
    );
  }
}
