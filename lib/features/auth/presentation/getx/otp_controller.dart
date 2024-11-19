// import 'dart:async';

// import 'package:icar/api/result/failures.dart';
// import 'package:icar/config/routre/app_routes.dart';
// import 'package:icar/features/auth/domain/usecases/verify_otp_usecase.dart';
// import 'package:icar/utils/helper_controller.dart';
// import 'package:icar/utils/shared_pref_helper.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:get_it/get_it.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// FirebaseMessaging messaging = FirebaseMessaging.instance;

// class OtpController extends GetxController {
//   final phoneNumberWithCountryCode = Get.arguments as String;

//   RxInt remainingSeconds = 60.obs;
//   Timer? _timer;
//   late final TextEditingController otpController;
//   final VerifyOtpUseCase verifyOtpUseCase = GetIt.I<VerifyOtpUseCase>();
//   final isLoading = false.obs;
//   StreamController<ErrorAnimationType>? errorAnimationController;

//   @override
//   void onInit() {
//     errorAnimationController = StreamController<ErrorAnimationType>();
//     super.onInit();
//     startTimer();
//     otpController = TextEditingController();
//     //   messaging.getToken().then((value) {
//     //  PrefHelper.instance.setSecuredString('fcm_token', value!);
//     //  PrefHelper.instance.setString('fcm_token', value);
//     //  print('FCM Token: $value');
//     // });
//   }

//   Future<void> verifyOtp() async {
//     // print(phoneNumberWithCountryCode.toString());
//     isLoading.value = true;
//     EasyLoading.show(status: 'loading');
//     final result = await verifyOtpUseCase.call(
//       phoneNumberWithCountryCode,
//       otpController.text,
//     );

//     result.fold(
//       (failure) {
//         otpController.clear();
//         if (failure is ServerFailure && failure.errors != null) {
//           print('Details: ${failure.message} ${failure.errors}');
//         }
//         errorAnimationController!
//             .add(ErrorAnimationType.shake); // Trigger shake animation
//         return Helper.errorSnackBar(
//             failure.code == 'E429' ? failure.message : failure.errors);
//       },
//       (user) {
//         print('==================${user.mobileNumber}');
//         if (user.isCompleteRegister == 0) {
//           Get.offNamed(AppRoutes.signupScreen, arguments: user);
//           return Helper.successSnackBar(
//             'Complete your Account Details',
//           );
//         } else {
//           PrefHelper.instance.setLogin(true);
//           Get.offAllNamed(AppRoutes.dashboardScreen);
//           // return Helper.successSnackBar(
//           //   'Welcome back ${user.name}',
//           // );
//         }
//       },
//     );
//     isLoading.value = false;
//     EasyLoading.dismiss();
//   }

//   @override
//   void onClose() {
//     errorAnimationController?.close();
//     _timer?.cancel();
//     // otpController.dispose();
//     super.onClose();
//   }

//   void startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       remainingSeconds.value--;

//       if (remainingSeconds.value <= 0) {
//         _timer?.cancel();
//         update();
//       }
//     });
//   }

//   void resendCode(Function resendCodeFunction) async {
//     if (await resendCodeFunction()) {
//       remainingSeconds.value = 60; // Reset the timer to the initial value
//       startTimer();

//       update();
//     }
//   }
// }
// // import 'dart:async';
// // import 'package:icar/api/result/failures.dart';
// // import 'package:icar/config/app_strings.dart';
// // import 'package:icar/config/routre/app_routes.dart';
// // import 'package:icar/features/auth/domain/usecases/verify_otp_usecase.dart';
// // import 'package:icar/features/auth/presentation/getx/signin_controller.dart';
// // import 'package:icar/utils/helper_controller.dart';
// // import 'package:icar/utils/shared_pref_helper.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get_it/get_it.dart';
// // import 'package:pin_code_fields/pin_code_fields.dart';

// // class OtpController extends GetxController {
// //     final phoneNumberWithCountryCode = Get.arguments;
// //   RxInt remainingSeconds = 60.obs;
// //   Timer? _timer;
// //   late final TextEditingController otpController;
// //   final VerifyOtpUseCase verifyOtpUseCase = GetIt.I<VerifyOtpUseCase>();
// //   final isLoading = false.obs;
// //   StreamController<ErrorAnimationType>? errorAnimationController;

// //   @override
// //   void onInit() {
// //     errorAnimationController = StreamController<ErrorAnimationType>();
// //     otpController = TextEditingController();
// //     super.onInit();
// //     startTimer();
// //   }

// //   Future<void> verifyOtp() async {
// //     isLoading.value = true;
// //     final result = await verifyOtpUseCase.call(
// //       phoneNumberWithCountryCode,
// //       otpController.text,
// //     );
// //     isLoading.value = false;
// //     result.fold(
// //       (failure) {
// //         otpController.clear(); // Clear the OTP field on failure
// //         if (failure is ServerFailure && failure.errors != null) {
// //           print('Details: ${failure.message} ${failure.errors}');
// //         }
// //         errorAnimationController!
// //             .add(ErrorAnimationType.shake); // Trigger shake animation
// //         return Helper.errorSnackBar(
// //             title: ohSnap,
// //             message: failure.code == 'E429' ? failure.message : failure.errors);
// //       },
// //       (user) {
// //         if (user.isCompleteRegister == 0) {
// //           Get.offNamed(AppRoutes.signupScreen, arguments: user);
// //           return Helper.successSnackBar(
// //             title: 'success',
// //             message: 'Complete your Account Details',
// //           );
// //         } else {
// //           PrefHelper.instance.setLogin(true);
// //           Get.offAllNamed(AppRoutes.dashboardScreen);
// //           return Helper.successSnackBar(
// //             title: 'success',
// //             message: 'Welcome back ${user.name}',
// //           );
// //         }
// //       },
// //     );
// //   }

// //   @override
// //   void onClose() {
// //     errorAnimationController?.close();
// //     _timer?.cancel();
// //     otpController.dispose();
// //     super.onClose();
// //   }

// //   void startTimer() {
// //     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
// //       remainingSeconds.value--;

// //       if (remainingSeconds.value <= 0) {
// //         _timer?.cancel();
// //         update();
// //       }
// //     });
// //   }

// //   void resendCode(Function resendCodeFunction) async {
// //     if (await resendCodeFunction()) {
// //       remainingSeconds.value = 60; // Reset the timer to the initial value
// //       startTimer();

// //       update();
// //     }
// //   }
// // }
