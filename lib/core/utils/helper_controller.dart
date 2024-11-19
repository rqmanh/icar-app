
import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:icar/api/result/failures.dart';
import 'package:icar/app.dart';

import 'package:flutter/material.dart';
import 'package:icar/core/localization/local_keys.dart';

import 'package:iconsax/iconsax.dart';

class Helper {
  static void showCustomSnackBar({
    required String message,
    required Color backgroundColor,
    required IconData icon,
     Duration? duration
  }) {
    if (Get.context != null) {
      Flushbar(
        backgroundColor: backgroundColor,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        messageText: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 5),
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.GROUNDED,
      ).show(Get.context!);
    }
  }

  static void successSnackBar(String? message) {
    showCustomSnackBar(
      message: message ?? '',
      backgroundColor: Colors.green,
      icon: Iconsax.check5,
    );
  }

  static void warningSnackBar({required String title, String? message}) {
    showCustomSnackBar(
      message: message ?? '',
      backgroundColor: Colors.orange,
      icon: Iconsax.warning_2,
    );
  }


  static void errorSnackBar( String? message) {
    showCustomSnackBar(
      message: message ?? '',
      backgroundColor: Colors.red.shade600,
      icon: Iconsax.warning_21,
    );
  }

  static void modernSnackBar({String? title, String? message}) {
    showCustomSnackBar(
      message: message ?? '',
      backgroundColor: Colors.blueGrey,
      icon: Icons.info,
    );
  }

  static void handleFailureMessage(Failure failure) {
    if (failure is NotSpecificFailure) {
      errorSnackBar( failure.message);
    } else {
      String message = failure.message;
      if (failure.errors != null) {
        message = (failure.errors as Map).entries.map((entry) {
          final key = entry.key;
          final value = entry.value;
          return '$key: $value';
        }).join('\n');
      }
      errorSnackBar( message);
    }
  }




  static String convert24To12(String time24) {
    List<String> parts = time24.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    String period = hour >= 12 ? "PM":"AM";
    hour = hour % 12;
    hour = hour == 0 ? 12 : hour; // Handle midnight (00:00) as 12 AM

    return '$hour:${minute.toString().padLeft(2, '0')} $period';
  }


static String convertTo24HourFormat(String time) {
  // Replace Arabic AM/PM with English equivalents
  time = time.replaceAll('ص', 'AM').replaceAll('م', 'PM');

  try {
    final DateFormat inputFormat = DateFormat('hh:mm a');
    final DateFormat outputFormat = DateFormat('HH:mm:ss');
    final DateTime parsedTime = inputFormat.parse(time);
    return outputFormat.format(parsedTime);
  } catch (e) {
    // Handle exception gracefully by returning an error message or a default value
    return 'Invalid time format';
  }

}

}
