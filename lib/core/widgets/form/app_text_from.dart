
import 'package:easy_localization/easy_localization.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';


class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeHolder;
  final bool isEditor;
  final bool obscureText;
  final Color? color;
  final int? limit;
  final Function(String text)? onChange;

  const AppTextField(
      {super.key,
      required this.controller,
      required this.placeHolder,
      this.isEditor = false,
      this.color,
      this.limit,
      this.onChange,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isEditor ? 130 : 45,
      decoration: BoxDecoration(
        color: color ?? CColors.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: TextField(
        
        obscureText: obscureText,
        onChanged: onChange,
        textCapitalization: TextCapitalization.sentences,
        expands: isEditor ? true : false,
        minLines: isEditor ? null : 1,
        maxLines: isEditor ? null : 1,
        decoration: InputDecoration(
          labelStyle: CTextStyles.font14DarkMedium ,
          focusedBorder: InputBorder.none,
            hintText: placeHolder.tr(),
            hintStyle:
             CTextStyles.font14DarkMedium.copyWith(color: CColors.white.withOpacity(0.5)),
            border: InputBorder.none,
            counterText: '',
            isDense: true,
            contentPadding: const EdgeInsets.all(0)),
        cursorColor:CColors.primaryColor,
        maxLength: isEditor ? limit : null,
        style: CTextStyles.font14DarkMedium.copyWith(color: CColors.white),
        controller: controller,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
