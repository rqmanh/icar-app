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
    brightness: Brightness.dark,
    scaffoldBackgroundColor: CColors.scafBackgroundColor,

    textTheme: TTextTheme.lightTextTheme,
    // highlightColor: CColors.transparent,
    // hoverColor: CColors.transparent ,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    chipTheme: TChipTheme.chipLightTheme,
    focusColor: CColors.primaryColor,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: CColors.primaryColor.withOpacity(0.2),
      cursorColor: CColors.primaryColor,
      selectionHandleColor: CColors.primaryColor.withOpacity(0.2),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: CColors.backgroundColor
    )
    // radioTheme: RadioThemeData(

    // splashRadius: 0,  // Disable splash effect
    // overlayColor: MaterialStateProperty.all(Colors.transparent),  // Disable overlay color
    // fillColor: MaterialStateProperty.all(Colors.transparent),  // Disable fill color
    // mouseCursor: MaterialStateProperty.all(MouseCursor.defer),  // Optional: disable mouse interaction
    // ),
  );

//   static final ThemeData darkTheme = ThemeData(
//     indicatorColor: CColors.primaryColor,

//       fontFamily: AppConstants.fontFamily,
//           highlightColor: CColors.transparent,
//     hoverColor: CColors.transparent ,
//       primaryColor: CColors.primaryColor,
//       brightness: Brightness.dark,
//       textTheme: TTextTheme.darkTextTheme,
//       appBarTheme: TAppBarTheme.darkAppBarTheme,
//       chipTheme: TChipTheme.chipDarkTheme,
//       elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
//       outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
//       inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
//       textSelectionTheme: TextSelectionThemeData(
//         selectionColor: CColors.primaryColor.withOpacity(0.2),
//         cursorColor: CColors.primaryColor,
//         selectionHandleColor: CColors.primaryColor.withOpacity(0.2),
//       ));
}
