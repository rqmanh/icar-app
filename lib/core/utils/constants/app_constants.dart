
class AppConstants {
  static String fontFamily = 'IBM';
  static const String appName = 'iCar App';
  static const String appVersion = '1.0.0';
  static const String appUrl = '';
}

// Corner Radius-Smoothing
const cornerSmoothing = 1.0;

extension Optional on int {
  String makeToString() {
    var num = this;
    if (num > 999 && num < 99999) {
      return '${(num / 1000).toStringAsFixed(1)} K';
    } else if (num > 99999 && num < 999999) {
      return '${(num / 1000).toStringAsFixed(0)} K';
    } else if (num > 999999 && num < 999999999) {
      return '${(num / 1000000).toStringAsFixed(1)} M';
    } else if (num > 999999999) {
      return '${(num / 1000000000).toStringAsFixed(1)} B';
    } else {
      return num.toString();
    }
  }
}

extension O on num {
  String makeToString() {
    var num = this;
    if (num > 999 && num < 99999) {
      return '${(num / 1000).toStringAsFixed(1)} K';
    } else if (num > 99999 && num < 999999) {
      return '${(num / 1000).toStringAsFixed(0)} K';
    } else if (num > 999999 && num < 999999999) {
      return '${(num / 1000000).toStringAsFixed(1)} M';
    } else if (num > 999999999) {
      return '${(num / 1000000000).toStringAsFixed(1)} B';
    } else {
      return num.toString();
    }
  }
}
