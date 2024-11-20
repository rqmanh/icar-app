import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icar/core/widgets/sheets/web_sheet_view.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtils {
static void openURLSheet({
  required BuildContext context,
  required String title,
  required String url,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => WebSheetScreen(title: title, url: url),
  ).then((value) {
    changStatusBar(StatusBarStyle.black);
  });
}

  static void setStatusBarLight() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  static void changStatusBar(StatusBarStyle style) {
    switch (style) {
      case StatusBarStyle.white:
        setStatusBarLight();
        break;
      case StatusBarStyle.black:
        setStatusBarDark();
        break;
    }
  }

  static void setStatusBarDark() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }
  static void changeStatusBar(Color color) {
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width;
  }


  static double getScreenHeight(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .height;
  }

  static bool isDarkMode(BuildContext context) {
    return Theme
        .of(context)
        .brightness == Brightness.dark;
  }

  static bool isPortrait(BuildContext context) {
    return MediaQuery
        .of(context)
        .orientation == Orientation.portrait;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery
        .of(context)
        .orientation == Orientation.landscape;
  }

  static bool isAndroid(BuildContext context) {
    return Theme
        .of(context)
        .platform == TargetPlatform.android;
  }

  static bool isIOS(BuildContext context) {
    return Theme
        .of(context)
        .platform == TargetPlatform.iOS;
  }
// static void launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
}
class MapUtils {

  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    // String mapUrl =
    // 'https://maps.apple.com/?sll=$latitude,$longitude';
     if (await canLaunchUrl(Uri.parse(googleUrl))) {
        await launchUrl(Uri.parse(googleUrl));
     } else {
        throw 'Could not open the map.';
     }
  }
}


String formatDateTime(String datetime) {
  DateTime parsedDate = DateTime.parse(datetime);
  DateTime now = DateTime.now();

  DateFormat timeFormat = DateFormat('h:mm a'); // e.g., 2:30 PM
  DateFormat dayTimeFormat = DateFormat('MMM d h:mm a'); // e.g., Aug 5 2:30 PM
  DateFormat fullFormat = DateFormat('MMM d, y h:mm a'); // e.g., Aug 5, 2024 2:30 PM

  if (parsedDate.year != now.year) {
    return fullFormat.format(parsedDate); // Different year
  } else if (parsedDate.difference(now).inDays == 0) {
    return timeFormat.format(parsedDate); // Same day
  } else {
    return dayTimeFormat.format(parsedDate); // Same year, different day
  }
}
enum StatusBarStyle { white, black }