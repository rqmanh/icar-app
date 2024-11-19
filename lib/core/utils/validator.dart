// import 'package:icar/core/localization/local_keys.dart';


// class ValidationHelper {
//   static String? emptyValidator(String? value, {String? message}) {
//     if (value == null || value.isEmpty) {
//       return message ?? Lkeys.requiredField.tr;
//     }
//     return null;
//   }

//   static bool isEmptyValidator(String? value) {
//     return value == null || value.isEmpty;
//   }

//   static String? emailValidator(String? value, {String? message}) {
//     if (isEmptyValidator(value)) {
//       return Lkeys.emailCannotEmpty.tr;
//     }
//     if (!GetUtils.isEmail(value!)) {
//       return message ?? Lkeys.invalidEmailFormat.tr;
//     }
//     return null;
//   }

// static String? crNumberValidator(String? value, {String? message}) {
//     if (isEmptyValidator(value)) {
//       return Lkeys.requiredField.tr;
//     }
//     if (!GetUtils.isNumericOnly(value!)) {
//       return message ?? Lkeys.invalidFormat.tr;
//     }
//     return null;
//   }
//   static String? passwordValidator(String? value,
//       {int min = 8, max = 30, String? confirmPass}) {
//     if (isEmptyValidator(value)) {
//       return Lkeys.requiredField.tr;
//     }
//     if (GetUtils.isLengthLessThan(value!, min)) {
//       return Lkeys.shortPasswordError.tr;
//     }
//     if (GetUtils.isLengthGreaterThan(value, max)) {
//       return Lkeys.longPasswordError.tr;
//     }
//     if (confirmPass != null && value != confirmPass) {
//       return Lkeys.passwordsDoesNotMatch.tr;
//     }
//     return null;
//   }

//   static String? phoneValidation(String? value) {
//     if (isEmptyValidator(value)) {
//       return Lkeys.requiredField.tr;
//     }
//     if (GetUtils.isLengthLessThan(value!, 8)) {
//       return Lkeys.phoneTooShort.tr;
//     }
//     if (GetUtils.isLengthGreaterThan(value, 15)) {
//       return Lkeys.phoneTooLong.tr;
//     }
//     return null;
//   }

//   static String? nameValidator(String? value,
//       {bool checkimpty = true, String? message}) {
//     if (value == null) {
//       return null;
//     }
//     if (checkimpty && isEmptyValidator(value)) {
//       return message ?? Lkeys.requiredField.tr;
//     }
//     if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$').hasMatch(value)) {
//       return message ?? Lkeys.invalidNameFormat.tr;
//     }
//     return null;
//       }
//   static String? usernameValidator(String? value,
//       {int min = 3, int max = 10, String? message}) {
//     if (isEmptyValidator(value)) {
//       return message ?? Lkeys.requiredField.tr;
//     }
//     // if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value!)) {
//     // if (!RegExp(r'^@[a-zA-Z0-9_]+$').hasMatch(value!)) {
//     //   return message ?? LKeys.invalidUsernameFormat.tr;
//     // }
    
//     if (GetUtils.isUsername('@${value!}')) {
//       return message ?? Lkeys.invalidUsernameFormat.tr;
      
//     }
//     if (GetUtils.isLengthLessThan(value, min)) {
//       return message ?? Lkeys.shortUsernameError.tr;
//     }
//     if (GetUtils.isLengthGreaterThan(value, max)) {
//       return message ?? Lkeys.longUsernameError.tr;
//     }
//     return null;
//   }

//   static String? numberValidator(String? value, {String? message}) {
//     if (isEmptyValidator(value)) {
//       return message ?? Lkeys.requiredField.tr;
//     }
//     if (!GetUtils.isNumericOnly(value!)) {
//       return message ?? Lkeys.invalidFormat.tr;
//     }
//     return null;
//   }

//   static String? priceValidator(String? value, {String? message}) {
//     // if (isEmptyValidator(value)) {
//     //   return message ?? LKeys.requiredField.tr;
//     // }
//     if (isEmptyValidator(value)) {
//       return null;
      
//     }
//     if (!RegExp(r'^[0-9]+(\.[0-9]{1,2})?$').hasMatch(value!)) {
//       return message ?? Lkeys.invalidFormat.tr;
//     }
//     return null;
//   }

//   // Address Validator
//   static String? addressValidator(String? value, {String? message}) {
//     if (isEmptyValidator(value)) {
//       return message ?? Lkeys.requiredField.tr;
//     }
//     // Additional address validation logic can go here
//     // Example: if (value.length < 10) { return 'Address too short'; }
//     return null;
//   }
// }


// extension Validation on String {
//   bool get isEmail => ValidationHelper.emailValidator(this) == null;
//   bool get isPassword => ValidationHelper.passwordValidator(this) == null;
//   bool get isPhone => ValidationHelper.phoneValidation(this) == null;
//   bool get isName => ValidationHelper.nameValidator(this) == null;
//   bool get isUsername => ValidationHelper.usernameValidator(this) == null;
//   bool get isNumber => ValidationHelper.numberValidator(this) == null;
//   bool get isPrice => ValidationHelper.priceValidator(this) == null;
//   bool get isAddress => ValidationHelper.addressValidator(this) == null;
//   bool get isCrNumber => ValidationHelper.crNumberValidator(this) == null;
// }

