import 'package:icar/config/app_keys.dart';

class ValidationHelper {
  static String? emptyValidator(String? value, {String? message}) {
    if (value == null || value.isEmpty) {
      return message ?? AppKeys.requiredField;
    }
    return null;
  }

  static bool isEmptyValidator(String? value) {
    return value == null || value.isEmpty;
  }

  static String? emailValidator(String? value, {String? message}) {
    if (isEmptyValidator(value)) {
      return AppKeys.emailCannotEmpty;
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value!)) {
      return message ?? AppKeys.invalidEmailFormat;
    }
    return null;
  }

  static String? crNumberValidator(String? value, {String? message}) {
    if (isEmptyValidator(value)) {
      return AppKeys.requiredField;
    }
    final crNumberRegex = RegExp(r'^\d+$');
    if (!crNumberRegex.hasMatch(value!)) {
      return message ?? AppKeys.invalidFormat;
    }
    return null;
  }

  static String? passwordValidator(String? value,
      {int min = 8, max = 30, String? confirmPass}) {
    if (isEmptyValidator(value)) {
      return AppKeys.requiredField;
    }
    if (value!.length < min) {
      return AppKeys.shortPasswordError;
    }
    if (value.length > max) {
      return AppKeys.longPasswordError;
    }
    if (confirmPass != null && value != confirmPass) {
      return AppKeys.passwordsDoesNotMatch;
    }
    return null;
  }

  static String? phoneValidation(String? value) {
    if (isEmptyValidator(value)) {
      return AppKeys.requiredField;
    }
    final phoneRegex = RegExp(r'^\+?[0-9]{8,15}$');
    if (!phoneRegex.hasMatch(value!)) {
      return AppKeys.phoneInvalid;
    }
    return null;
  }

  static String? nameValidator(String? value,
      {bool checkEmpty = true, String? message}) {
    if (value == null) {
      return null;
    }
    if (checkEmpty && isEmptyValidator(value)) {
      return message ?? AppKeys.requiredField;
    }
    final nameRegex = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return message ?? AppKeys.invalidNameFormat;
    }
    return null;
  }

  static String? usernameValidator(String? value,
      {int min = 3, int max = 10, String? message}) {
    if (isEmptyValidator(value)) {
      return message ?? AppKeys.requiredField;
    }
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!usernameRegex.hasMatch(value!)) {
      return message ?? AppKeys.invalidUsernameFormat;
    }
    if (value.length < min) {
      return message ?? AppKeys.shortUsernameError;
    }
    if (value.length > max) {
      return message ?? AppKeys.longUsernameError;
    }
    return null;
  }

  static String? numberValidator(String? value, {String? message}) {
    if (isEmptyValidator(value)) {
      return message ?? AppKeys.requiredField;
    }
    final numberRegex = RegExp(r'^\d+$');
    if (!numberRegex.hasMatch(value!)) {
      return message ?? AppKeys.invalidFormat;
    }
    return null;
  }

  static String? priceValidator(String? value, {String? message}) {
    if (isEmptyValidator(value)) {
      return null;
    }
    final priceRegex = RegExp(r'^[0-9]+(\.[0-9]{1,2})?$');
    if (!priceRegex.hasMatch(value!)) {
      return message ?? AppKeys.invalidFormat;
    }
    return null;
  }

  static String? addressValidator(String? value, {String? message}) {
    if (isEmptyValidator(value)) {
      return message ?? AppKeys.requiredField;
    }
    // Additional address validation logic can go here
    // Example: if (value.length < 10) { return 'Address too short'; }
    return null;
  }
}

extension Validation on String {
  bool get isEmail => ValidationHelper.emailValidator(this) == null;
  bool get isPassword => ValidationHelper.passwordValidator(this) == null;
  bool get isPhone => ValidationHelper.phoneValidation(this) == null;
  bool get isName => ValidationHelper.nameValidator(this) == null;
  bool get isUsername => ValidationHelper.usernameValidator(this) == null;
  bool get isNumber => ValidationHelper.numberValidator(this) == null;
  bool get isPrice => ValidationHelper.priceValidator(this) == null;
  bool get isAddress => ValidationHelper.addressValidator(this) == null;
  bool get isCrNumber => ValidationHelper.crNumberValidator(this) == null;
}
