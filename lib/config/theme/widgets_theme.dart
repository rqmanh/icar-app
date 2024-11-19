import 'package:icar/config/app_colors.dart';
import 'package:icar/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: CColors.iconColorLight, size: 18.0),
    actionsIconTheme:
        IconThemeData(color: CColors.iconColorLight, size: 18.0),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: CColors.iconColorDark, size: 18.0),
    actionsIconTheme: IconThemeData(color: CColors.iconColorDark, size: 18.0),
  );
}

/* -- Light & Dark Text Themes -- */
class TTextTheme {
  TTextTheme._(); //To avoid creating instances

  /* -- Light Text Theme -- */
  static TextTheme lightTextTheme = TextTheme(
    displayLarge:  TextStyle(
        fontSize: 28.0,
        fontFamily: AppConstants.fontFamily,
        fontWeight: FontWeight.bold,
        color: CColors.black),
    displayMedium:  TextStyle(
        fontSize: 24.0,
        fontFamily: AppConstants.fontFamily,
        fontWeight: FontWeight.w700,
        color: CColors.black),
    displaySmall:  TextStyle(
        fontSize: 24.0,
        fontFamily: AppConstants.fontFamily,
        fontWeight: FontWeight.normal,
        color: CColors.black),
    headlineMedium:  TextStyle(
        fontSize: 18.0,
        fontFamily: AppConstants.fontFamily,
        fontWeight: FontWeight.w600,
        color: CColors.black),
    headlineSmall:  TextStyle(
        fontSize: 18.0,
        fontFamily: AppConstants.fontFamily,
        fontWeight: FontWeight.normal,
        color: CColors.black),
    titleLarge:  TextStyle(
        fontSize: 14.0,
        fontFamily: AppConstants.fontFamily,
        fontWeight: FontWeight.w600,
        color: CColors.black),
    bodyLarge:  TextStyle(
        fontSize: 14.0,
        fontFamily: AppConstants.fontFamily,
        color: CColors.black),
    bodyMedium: TextStyle(
        fontSize: 14.0,
        fontFamily: AppConstants.fontFamily,
        color: CColors.black.withOpacity(0.8)),
  );

  /* -- Dark Text Theme -- */
  static TextTheme darkTextTheme = TextTheme(
    displayLarge:  TextStyle(
        fontSize: 28.0,
        fontFamily: AppConstants.fontFamily,
        fontWeight: FontWeight.bold,
        color: CColors.white),
    displayMedium:  TextStyle(
        fontSize: 24.0,
        fontFamily: AppConstants.fontFamily,
        fontWeight: FontWeight.w700,
        color: CColors.white),
    displaySmall:  TextStyle(
        fontSize: 24.0,
        fontFamily: AppConstants.fontFamily,
        fontWeight: FontWeight.normal,
        color: CColors.white),
    headlineMedium:  TextStyle(
        fontSize: 18.0,
        fontFamily: AppConstants.fontFamily,
        fontWeight: FontWeight.w600,
        color: CColors.white),
    headlineSmall:  TextStyle(
        fontSize: 18.0,
        fontFamily: AppConstants.fontFamily,
        fontWeight: FontWeight.normal,
        color: CColors.white),
    titleLarge:  TextStyle(
        fontSize: 14.0,
        fontFamily: AppConstants.fontFamily,
        fontWeight: FontWeight.w600,
        color: CColors.white),
    bodyLarge:  TextStyle(
        fontSize: 14.0,
        fontFamily: AppConstants.fontFamily,
        color: CColors.white),
    bodyMedium: TextStyle(
        fontSize: 14.0,
        fontFamily: AppConstants.fontFamily,
        color: CColors.white.withOpacity(0.8)),
  );
}

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    prefixIconColor: CColors.secondaryColor,
    floatingLabelStyle: TextStyle(color: CColors.secondaryColor),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(width: 2, color: CColors.secondaryColor),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    prefixIconColor: CColors.primaryColor,
    floatingLabelStyle: const TextStyle(color: CColors.primaryColor),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(width: 2, color: CColors.primaryColor),
    ),
  );
}

/* -- Light & Dark Outlined Button Themes -- */
class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: CColors.secondaryColor,
      side: BorderSide(color: CColors.secondaryColor),
      padding: const EdgeInsets.symmetric(vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: CColors.white,
      side: const BorderSide(color: CColors.white),
      padding: const EdgeInsets.symmetric(vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
  );
}

/* -- Light & Dark Elevated Button Themes -- */
class TElevatedButtonTheme {
  TElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CColors.white,
      backgroundColor: CColors.black,
      side: const BorderSide(color: CColors.black),
      padding: const EdgeInsets.symmetric(vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CColors.backgroundColorDark,
      backgroundColor: CColors.primaryColor,
      side: const BorderSide(color: CColors.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
  );
}

class TChipTheme {
  TChipTheme._();

  static final chipLightTheme = ChipThemeData(
    backgroundColor: CColors.white,
    selectedColor: CColors.primaryColor.withOpacity(0.88),
    checkmarkColor: CColors.white,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );

  static final chipDarkTheme = ChipThemeData(
    backgroundColor: CColors.darkGray,
    selectedColor: CColors.primaryColor.withOpacity(0.88),
    checkmarkColor: CColors.white,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );
}
