import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icar/config/app_colors.dart';
import 'package:phone_form_field/phone_form_field.dart';

class AppPhoneFormField extends StatelessWidget {
  final PhoneController controller;
  final FormFieldValidator<PhoneNumber>? validator;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final InputDecoration decoration;
  final List<TextInputFormatter>? inputFormatters;

  const AppPhoneFormField({
    super.key,
    required this.controller,
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.phone,
    this.inputFormatters,
    required this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PhoneFormField(
        countryButtonStyle: const CountryButtonStyle(
          flagSize: 30,
          textStyle: TextStyle(color: CColors.black),
        ),
        countrySelectorNavigator: const CountrySelectorNavigator.modalBottomSheet(),
        cursorColor: CColors.primaryColor,
        autovalidateMode: AutovalidateMode.disabled,
        style: const TextStyle(color: CColors.gray),
        validator: validator,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        controller: controller,
        decoration: decoration,
        inputFormatters: inputFormatters,
      ),
    );
  }
}
