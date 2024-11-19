
import 'package:icar/core/utils/shared_pref_helper.dart';

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

  String toConversationId() {
    var array = [PrefHelper.instance.getUserId(), this]..sort();
    return array.join('-');
  }
}
