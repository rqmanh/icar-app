
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/theme/app_text_styles.dart';

import 'button_loading_widget.dart';

class TPrimaryButton extends StatelessWidget {
  const TPrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
    this.isFullWidth = true,
    this.width = 80.0,
    this.buttonColor = CColors.primaryColor, // Default color is blue
    this.textColor = CColors.white,
  });

  final String text;
  final VoidCallback onTap;
  final bool isLoading;
  final bool isFullWidth;
  final double width;
  final Color buttonColor; // Color of the button
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : width.w,
      child: ElevatedButton(
        
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(buttonColor),
          foregroundColor: WidgetStateProperty.all<Color>(textColor),
        ),
        onPressed: onTap,
        child: isLoading
            ? const ButtonLoadingWidget()
            : Text(
                text,
                style: CTextStyles.font16WhiteSemiBold,
              ),
      ),
    );
  }
}

class AppGesterDedector extends StatelessWidget {


  const AppGesterDedector({
    super.key,
    required this.onTap,
    required this.text,
    this.color,
    this.btnColor= CColors.primaryColor,
    this.isLoading = false,
    this.height=50,
    this.width,
     this.fontSize,
    this.textStyle,

  });
  final void Function() onTap;
  final String text;
  final TextStyle ?textStyle;

  final Color? color;
  final Color? btnColor ;
  final bool isLoading;
  final double ?fontSize;
  final double ?height;
  final double ?width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:
      //  ScaleDownTransitionWidget(
      //   minSize: 0.9,
        // child: 
        Container(
          height: height,
          width:width?? double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  color: Colors.black12.withOpacity(.2),
                  offset: const Offset(2, 2))
            ],
            borderRadius: BorderRadius.circular(12),
            // borderRadius: BorderRadius.circular(30).copyWith(
            //     topRight: Radius.circular(0), bottomLeft: Radius.circular(0)),
            // gradient: LinearGradient(colors: [
            //   Colors.purple.shade200,
            //   Colors.purple.shade900,
            // ],
            // ),
            color: btnColor,
          ),
          child:
          isLoading ? const ButtonLoadingWidget() :
           Text(
            text.toUpperCase(),
            style:textStyle?.copyWith(fontSize: fontSize) ?? Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize:fontSize)
          ),
        ),
      // ),
      // style: ElevatedButton.styleFrom(
      //   backgroundColor: Colors.deepPurple,
      //   shadowColor: Colors.deepPurple,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(30),
      //   ),
      // ),
    );
  }
}

class AppGesterDedectorOutline extends StatelessWidget {


  const AppGesterDedectorOutline({
    super.key,
    required this.onTap,
    required this.text,
    this.color,
    this.btnColor= CColors.primaryColor,
    this.isLoading = false,
    this.height=44,
    this.width,
     this.fontSize,
    this.textStyle,

  });
  final void Function() onTap;
  final String text;
  final TextStyle ?textStyle;

  final Color? color;
  final Color? btnColor ;
  final bool isLoading;
  final double ?fontSize;
  final double ?height;
  final double ?width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:
      //  ScaleDownTransitionWidget(
      //   minSize: 0.9,
        // child: 
        Container(
          height: height,
          width:width?? double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  color: Colors.black12.withOpacity(.2),
                  offset: const Offset(2, 2))
            ],
            borderRadius: BorderRadius.circular(12),
            // borderRadius: BorderRadius.circular(30).copyWith(
            //     topRight: Radius.circular(0), bottomLeft: Radius.circular(0)),
            // gradient: LinearGradient(colors: [
            //   Colors.purple.shade200,
            //   Colors.purple.shade900,
            // ],
            // ),
            color: btnColor,
          ),
          child:
          isLoading ? const ButtonLoadingWidget() :
           Text(
            text.toUpperCase(),
            style:textStyle?.copyWith(fontSize: fontSize) ?? Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize:fontSize)
          ),
        ),
      // ),
      // style: ElevatedButton.styleFrom(
      //   backgroundColor: Colors.deepPurple,
      //   shadowColor: Colors.deepPurple,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(30),
      //   ),
      // ),
    );
  }
}

class AppButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final bool isLoading;
  
  const AppButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
     this.isLoading = false, this.buttonWidth,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0,),
            side: const BorderSide(color: CColors.borderColor)
            
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? CColors.primaryColor,
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 14.h,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 50.h),
        ),
      ),
      onPressed: onPressed,
      child:isLoading ? const ButtonLoadingWidget() : Text(
        buttonText,
        style: textStyle,
      ));
  }
}

class AppButtonOutline extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle ?textStyle;
  final VoidCallback onPressed;
  const AppButtonOutline({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
     this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
        border: Border.all(
          color: backgroundColor ?? CColors.primaryColor,
        ),
      ),
      width: buttonWidth?.w,
      height: buttonHeight?.h ?? 50.h,
      child: TextButton(
        style: ButtonStyle(
          
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16.0),

            ),
          ),
        
          
          padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(
              horizontal: horizontalPadding?.w ?? 12.w,
              vertical: verticalPadding?.h ?? 14.h,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: textStyle,
        ),
      ),
    );
  }
}
