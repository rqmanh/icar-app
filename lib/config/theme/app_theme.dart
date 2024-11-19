import 'package:icar/config/app_colors.dart';
import 'package:icar/config/theme/widgets_theme.dart';
import 'package:icar/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static final ThemeData lightTheme = ThemeData(
    fontFamily: AppConstants.fontFamily,
    primaryColor: CColors.primaryColor,
    splashColor: CColors.primaryColor,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    chipTheme: TChipTheme.chipLightTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: CColors.primaryColor.withOpacity(0.2),
      cursorColor: CColors.primaryColor,
      selectionHandleColor: CColors.primaryColor.withOpacity(0.2),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    indicatorColor: CColors.primaryColor,

      fontFamily: AppConstants.fontFamily,
      
      primaryColor: CColors.primaryColor,
      brightness: Brightness.dark,
      textTheme: TTextTheme.darkTextTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      chipTheme: TChipTheme.chipDarkTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: CColors.primaryColor.withOpacity(0.2),
        cursorColor: CColors.primaryColor,
        selectionHandleColor: CColors.primaryColor.withOpacity(0.2),
      ));
}
