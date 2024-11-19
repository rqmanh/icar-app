// import 'package:icar/config/app_colors.dart';
// import 'package:icar/core/localization/local_keys.dart';
// import 'package:icar/core/widgets/custom_asset_image_widget.dart';
// import 'package:icar/features/auth/presentation/getx/signin_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:icar/features/auth/presentation/getx/otp_controller.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// class OtpVerificationScreen extends StatelessWidget {


//   const OtpVerificationScreen(
//       {super.key, });

//   @override
//   Widget build(BuildContext context) {
//     final phoneNumberWithCountryCode = Get.arguments;
//     // final validateController = Get.find<OtpController>();
//     final controller = Get.find<OtpController>();
//     // String maskedPhoneNumber = maskPhoneNumber(phoneNumberWithCountryCode);

//     return Scaffold(
//       backgroundColor: CColors.scafBackgroundColorDark,
//       appBar: AppBar(

    
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//       ),
//       body: SafeArea(
        
//         child: Column(
//           children: [
//             // Row(
//             //   children: [
//             //     IconButton(
//             //       icon: const Icon(Icons.arrow_back_ios_new_rounded),
//             //       onPressed: () {
//             //         // Get.toNamed(AppRoutes.signinScreen);
//             //         // Get.find<SignInController>().phoneNumberController=PhoneNumber(nsn: '', isoCode: '');
//             //         Get.back();
//             //       },
//             //     ),
//             //     const Spacer(),
//             //     // IconButton(
//             //     //   icon: const Icon(Icons.close),
//             //     //   onPressed: () {
//             //     //     Get.back();
//             //     //   },
//             //     // ),
//             //   ],
//             // ),
//             const CustomAssetImageWidget('assets/images/app_logo.png', height: 100),
//             20.verticalSpace,
//             Text(
//               '${Lkeys.otpMessage.tr} ${phoneNumberWithCountryCode.substring(9)}',
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20.0),
//             Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: GetBuilder<OtpController>(
//                 init: OtpController(),
//                 initState: (_) {},
//                 builder: (_) {
//                   return GetBuilder<SignInController>(
//                     init: SignInController(),
//                     builder: (_) {
//                       return PinCodeTextField(
                        
                       
//                         hapticFeedbackTypes: HapticFeedbackTypes.light,
//                         autoDismissKeyboard: true,
//                         useHapticFeedback: true,
//                         controller: controller.otpController,
//                         errorAnimationController: controller
//                             .errorAnimationController, // Add error animation controller
//                         appContext: context,
//                         length: 4,
//                         obscureText: false,
//                         animationType: AnimationType.fade,
//                         pinTheme: PinTheme(
                                    
//                           shape: PinCodeFieldShape.box,
//                           borderRadius: BorderRadius.circular(15),
//                           fieldHeight: 50,
//                           fieldWidth: 80,
//                           activeFillColor: CColors.primaryColor,
//                           selectedFillColor: CColors.cardBackgroundColorDark,
                        
//                           inactiveFillColor: CColors.cardBackgroundColorDark,
//                           activeColor: Theme.of(context).primaryColor,
//                           selectedColor: Theme.of(context).primaryColor,
//                           inactiveColor:
//                               Theme.of(context).primaryColor.withOpacity(0.5),
//                         ),
//                         animationDuration: const Duration(milliseconds: 300),
//                         backgroundColor: Colors.transparent,
//                         enableActiveFill: true,
//                         cursorColor: Colors.white,
//                         keyboardType: TextInputType.number,
//                         onCompleted: (verificationCode) async {
//                           controller.otpController.text = verificationCode;
//                           controller.verifyOtp();
                          
//                         },
//                         onChanged: (value) {},
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//             // const SizedBox(height: 15.0),
//             Obx(() => Column(
//                   children: [
//                     if (controller.remainingSeconds.value <= 0)
//                       TextButton(
//                         onPressed: () async {
//                           Get.find<SignInController>().sendOtp();
//                           controller.otpController.clear();
//                           // validateController.resendCode(_controller.sendOtp);
//                           controller.startTimer();
//                           controller.remainingSeconds.value = 59;
//                         },
//                         child: Text(
//                         Lkeys.resendCode.tr,
//                           style: TextStyle(
//                               color: Theme.of(context)
//                                   .textTheme
//                                   .titleSmall!
//                                   .color),
//                         ),
//                       ),
//                     if (controller.remainingSeconds.value > 0)
//                       Text(
//                         '${Lkeys.waitFor.tr} ${controller.remainingSeconds.value} ${Lkeys.secondsToResendTheCode.tr}'
//                       ),
//                   ],
//                 )),
//           ],
//         ),
//       ),
//     );
//   }

//   String maskPhoneNumber(String phoneNumber) {
//     if (phoneNumber.length > 8) {
//       final start = phoneNumber.substring(0, 7);
//       final end = phoneNumber.substring(phoneNumber.length - 4);
//       final maskedSection = '*' * (phoneNumber.length - 10);
//       return '$start$maskedSection$end';
//     } else if (phoneNumber.length > 4) {
//       final start = phoneNumber.substring(0, 1);
//       final end = phoneNumber.substring(phoneNumber.length - 2);
//       final maskedSection = '*' * (phoneNumber.length - 3);
//       return '$start$maskedSection$end';
//     } else {
//       return phoneNumber;
//     }
//   }
// }
