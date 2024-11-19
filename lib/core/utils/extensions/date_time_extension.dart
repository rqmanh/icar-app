import 'package:easy_localization/easy_localization.dart';
import 'package:icar/config/app_keys.dart';


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
      return (numericDates) ? '1 day ago' : AppKeys.yesterday;
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hr';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : AppKeys.anHourAgo;
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} min';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : AppKeys.aMinuteAgo;
    } else if (difference.inSeconds >= 3) {
      return AppKeys.justNow;
    } else {
      return AppKeys.justNow;
    }
  }

  String timeAgoShort() {
  final date2 = DateTime.now().toUtc(); // Ensure both times are in UTC
  final difference = date2.difference(toUtc()); // Convert `this` to UTC for consistency

  if (difference.inDays >= 7) {
    return '1 ${'week'}';
  } else if (difference.inDays >= 2) {
    return '${difference.inDays} ${'days'}';
  } else if (difference.inDays >= 1) {
    return '1 ${'day'}';
  } else if (difference.inHours >= 2) {
    return '${difference.inHours} ${'hours'}';
  } else if (difference.inHours >= 1) {
    return '1 ${'hour'}';
  } else if (difference.inMinutes >= 2) {
    return '${difference.inMinutes} ${'minutes'}';
  } else if (difference.inMinutes >= 1) {
    return '1 ${'minute'}';
  } else if (difference.inSeconds >= 10) {
    return '${difference.inSeconds} ${'seconds'}';
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
