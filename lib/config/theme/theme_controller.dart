// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// import 'app_theme.dart';

// class ThemeController extends GetxController implements GetxService {
//   final RxBool _darkTheme = false.obs;

//   bool get darkTheme => _darkTheme.value;


//   void _updateStatusBar() {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: _darkTheme.value ? Colors.black : Colors.white,
//       statusBarIconBrightness: _darkTheme.value ? Brightness.light : Brightness.dark,
//     ));
//   }

//   void toggleTheme() {
//     _darkTheme.value = !_darkTheme.value;
//     Get.changeTheme(_darkTheme.value ? TAppTheme.darkTheme : TAppTheme.lightTheme);
//     _updateStatusBar();
//   }
// }

