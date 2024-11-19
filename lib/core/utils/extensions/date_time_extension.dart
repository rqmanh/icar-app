import 'package:easy_localization/easy_localization.dart';
import 'package:icar/core/localization/local_keys.dart';

import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String timeAgo({bool numericDates = false}) {
    final date2 = DateTime.now();
    final difference = date2.difference(this);
    if ((difference.inDays / 7).floor() >= 1) {
      var formattedDate = DateFormat('d MMM').format(this);
      return (numericDates) ? '1 week ago' : formattedDate;
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : Lkeys.yesterday.tr();
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hr';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : Lkeys.anHourAgo.tr();
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} min';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : Lkeys.aMinuteAgo.tr();
    } else if (difference.inSeconds >= 3) {
      return Lkeys.justNow.tr();
    } else {
      return Lkeys.justNow.tr();
    }
  }

  String timeAgoShort() {
  final date2 = DateTime.now().toUtc(); // Ensure both times are in UTC
  final difference = date2.difference(toUtc()); // Convert `this` to UTC for consistency

  if (difference.inDays >= 7) {
    return '1 ${'week'.tr()}';
  } else if (difference.inDays >= 2) {
    return '${difference.inDays} ${'days'.tr()}';
  } else if (difference.inDays >= 1) {
    return '1 ${'day'.tr()}';
  } else if (difference.inHours >= 2) {
    return '${difference.inHours} ${'hours'.tr()}';
  } else if (difference.inHours >= 1) {
    return '1 ${'hour'.tr()}';
  } else if (difference.inMinutes >= 2) {
    return '${difference.inMinutes} ${'minutes'.tr()}';
  } else if (difference.inMinutes >= 1) {
    return '1 ${'minute'.tr()}';
  } else if (difference.inSeconds >= 10) {
    return '${difference.inSeconds} ${'seconds'.tr()}';
  } else {
    return 'Just now';
  }
}



  String formatFullDate() {
    return DateFormat('dd MMM yyyy').format(this);
  }

  String formatTime() {
    return DateFormat('hh:mm a').format(this);
  }

  String formatTime24() {
    return DateFormat('HH:mm:ss').format(this);
  }

  String formatTime12() {
    return DateFormat('hh:mm a').format(this);
  }

  String formatDay() {
    return DateFormat('dd').format(this);
  }

  String formatMonth() {
    return DateFormat('MMM').format(this);
  }

  String formatYear() {
    return DateFormat('yyyy').format(this);
  }

  String formatMonthYear() {
    return DateFormat('MMM yyyy').format(this);
  }

  String formatMonthDay() {
    return DateFormat('MMM dd').format(this);
  }
  String formatDayMonth(){
    return DateFormat('dd MMM').format(this);
  }
}
