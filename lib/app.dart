import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icar/config/routre/app_routes.dart';
import 'package:icar/config/theme/app_theme.dart';
import 'package:icar/config/theme/widgets_theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'iCar',
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        theme: TAppTheme.lightTheme,
        routerConfig: router);
  }
}

class Get {
  static BuildContext? get context => navigatorKey.currentContext;
  static NavigatorState? get navigator => navigatorKey.currentState;
}
