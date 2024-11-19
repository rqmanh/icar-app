// import 'dart:async';
// import 'package:icar/features/auth/domain/usecases/send_otp_usecase.dart';
// import 'package:icar/features/auth/presentation/screens/otp_screen.dart';
// import 'package:icar/utils/helper_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_it/get_it.dart';
// import 'package:phone_form_field/phone_form_field.dart';

// class SignInController extends GetxController {
//   final SendOtpUseCase sendOtpUseCase = GetIt.I<SendOtpUseCase>();
//   String completeNumber = '';
//   PhoneController phoneNumberController = PhoneController();
//   final isLoading = false.obs;
//   GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  
// // Error Animation Controller
//   final ischeaked = false.obs;

//   Future<void> sendOtp() async {
//     if (loginFormKey.currentState!.validate()) {
//       isLoading.value = true;
//       final result = await sendOtpUseCase.call(
//         phoneNumberController.value.countryCode +
//             phoneNumberController.value.nsn,
//       );
//       isLoading.value = false;
//       result.fold(
//         (failure) {
//           Helper.errorSnackBar(
//               failure.code == 'E429' ? failure.message : failure.errors);
//         },
//         (success) {
//           Helper.successSnackBar(success.message);
//           Get.to(() => const OtpVerificationScreen(),
//               arguments: phoneNumberController.value.countryCode +
//                   phoneNumberController.value.nsn);
//         },
//       );
//       isLoading.value = false;
//     }
//   }

//   @override
//   void onInit() {
//     phoneNumberController.addListener(() {
//       completeNumber = phoneNumberController.value.countryCode +
//           phoneNumberController.value.nsn;
//     });
//     phoneNumberController = PhoneController(
//       initialValue: const PhoneNumber(isoCode: IsoCode.SA, nsn: ''),
//     );
//     super.onInit();
//   }

//   @override
//   void onClose() {
// // Close error animation controller

//     phoneNumberController.dispose();
//     // loginFormKey.currentState!.dispose();

//     super.onClose();
//   }
// }
// // import 'dart:async';
// // import 'package:icar/api/result/failures.dart';
// // import 'package:icar/config/app_strings.dart';
// // import 'package:icar/config/routre/app_routes.dart';
// // import 'package:icar/features/auth/domain/usecases/send_otp_usecase.dart';
// // import 'package:icar/features/auth/presentation/screens/otp_screen.dart';
// // import 'package:icar/utils/helper_controller.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get_it/get_it.dart';
// // import 'package:phone_form_field/phone_form_field.dart';

// // class SignInController extends GetxController {
// //   final SendOtpUseCase sendOtpUseCase = GetIt.I<SendOtpUseCase>();
// //   String completeNumber = '';
// //   PhoneController phoneNumberController = PhoneController();
// //   final isLoading = false.obs;
// //   GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

// //   Future<void> sendOtp() async {
// //     if (loginFormKey.currentState!.validate()) {
// //       isLoading.value = true;
// //       final result = await sendOtpUseCase.call(
// //         '+${phoneNumberController.value.countryCode + phoneNumberController.value.nsn}',
// //       );
// //       isLoading.value = false;
// //       result.fold(
// //         (failure) {
// //           return Helper.errorSnackBar(title: ohSnap, message: failure.errors);
// //         },
// //         (success) {
// //           Helper.successSnackBar(
// //               title: success.message, message: success.message);
// //           Get.to(() => const OtpVerificationScreen(),arguments: '+${phoneNumberController.value.countryCode + phoneNumberController.value.nsn}');
// //         },
// //       );
// //       isLoading.value = false;
// //     }
// //   }

// //   @override
// //   void onInit() {
// //     phoneNumberController.addListener(() {
// //       completeNumber =
// //           '+${phoneNumberController.value.countryCode + phoneNumberController.value.nsn}';
// //     });
// //     phoneNumberController = PhoneController(
// //       initialValue: const PhoneNumber(isoCode: IsoCode.SA, nsn: ''),
// //     );
// //     super.onInit();
// //   }

// //   @override
// //   void onClose() {
// //     phoneNumberController.dispose();
// //     super.onClose();
// //   }
// // }
