import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icar/config/routre/app_routes.dart';
import 'package:icar/config/theme/app_theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  const designSize = Size(412, 892);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize,
      fontSizeResolver: (fontSize, instance) {
        final display = View.of(context).display;
        final screenSize = display.size / display.devicePixelRatio;
        final scaleWidth = screenSize.width / designSize.width;

        return fontSize * scaleWidth;
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
          title: 'iCar',
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          theme: TAppTheme.lightTheme,
          routerConfig: router),
    );
  }
}

class Get {
  static BuildContext? get context => navigatorKey.currentContext;
  static NavigatorState? get navigator => navigatorKey.currentState;
}
