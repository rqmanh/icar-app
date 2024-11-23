import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icar/config/app_images.dart';
import 'package:icar/config/app_keys.dart';
import 'package:icar/config/routre/app_routes.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/widgets/form/form_header_widget.dart';
import 'package:icar/features/auth/presentation/cubit/otp_cubit.dart';
import 'package:icar/features/auth/presentation/cubit/otp_state.dart';

import 'package:pin_code_fields/pin_code_fields.dart';


class OtpScreen extends StatelessWidget {
  final String phoneNumber;

  const OtpScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: CColors.primaryColor),
            onPressed: () => context.pop()),
        backgroundColor: CColors.scafBackgroundColor,
        elevation: 0,
      ),
      backgroundColor: CColors.scafBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            // Header Widget with Localized Title and Subtitle
            FormHeaderWidget(
              image: AppImages.logo,
              title: AppKeys.otpTitle,
              subTitle: AppKeys.otpSubTitle,
            ),
      
            // OTP Message
            // Text(
            //   AppKeys.enterOtp
            //       .replaceAll("{phone_number}", maskPhoneNumber(phoneNumber)),
            //   textAlign: TextAlign.center,
            // ),
            const SizedBox(height: 20.0),
      
            // OTP Input Field
            Container(
              height: 110,
              // width: 150,
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: CColors.white),
              child: BlocBuilder<OtpCubit, OtpState>(
                builder: (context, state) {
                  return PinCodeTextField(
                    appContext: context,
                    controller:
                        TextEditingController(text: state.verificationCode),
                    onCompleted: (verificationCode) {
                      // context.read<OtpCubit>().verifyOtp(verificationCode);
                      context.push(AppRoutes.dashboardScreen);
                    },
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(18),
                      fieldHeight: 60,
                      fieldWidth: 50,
                      activeFillColor: CColors.borderColor,
                      selectedFillColor: CColors.primaryColor,
                      inactiveFillColor: CColors.borderColor,
                      activeColor: CColors.borderColor,
                      selectedColor: CColors.primaryColor,
                      inactiveColor: CColors.borderColor,
                    ),
                    hapticFeedbackTypes: HapticFeedbackTypes.light,
                    autoDismissKeyboard: true,
                    useHapticFeedback: true,
                    backgroundColor: Colors.transparent,
                    enableActiveFill: false,
                    keyboardType: TextInputType.number,
                  );
                },
              ),
            ),
            10.verticalSpace,
            // Resend OTP Button and Timer Logic
            BlocBuilder<OtpCubit, OtpState>(
              builder: (context, state) {
                return Column(
                  children: [
                    // Resend OTP button
                    if (state.remainingSeconds <= 0)
                      TextButton(
                        onPressed: () {
                          context.read<OtpCubit>().sendOtp(phoneNumber);
                        },
                        child: Text(
                          AppKeys.resendOtp,
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                    // Wait timer text
                    if (state.remainingSeconds > 0)
                      Text(
                          AppKeys.waitToResend.replaceAll(
                              "{seconds}", state.remainingSeconds.toString()),
                          style: CTextStyles.font12PrimaryMedium),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Mask Phone Number Helper Function
String maskPhoneNumber(String phoneNumber) {
  if (phoneNumber.length > 8) {
    final start = phoneNumber.substring(0, 7);
    final end = phoneNumber.substring(phoneNumber.length - 4);
    final maskedSection = '*' * (phoneNumber.length - 10);
    return '$start$maskedSection$end';
  } else if (phoneNumber.length > 4) {
    final start = phoneNumber.substring(0, 1);
    final end = phoneNumber.substring(phoneNumber.length - 2);
    final maskedSection = '*' * (phoneNumber.length - 3);
    return '$start$maskedSection$end';
  } else {
    return phoneNumber;
  }
}
