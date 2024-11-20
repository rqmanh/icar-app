
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_form_field/phone_form_field.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
  final PhoneController phoneNumberController = PhoneController(initialValue: const PhoneNumber(isoCode: IsoCode.SA, nsn: ''));


  SignInCubit() : super(SignInInitial());

  void toggleLoading(bool isLoading) {
    emit(SignInLoading(isLoading));
  }

  void validateAndSendOtp() {
    if (signinFormKey.currentState?.validate() ?? false) {
      emit(const SignInLoading(true));
      // Simulate OTP send
      Future.delayed(const Duration(seconds: 2), () {
        emit(const SignInSuccess("OTP Sent Successfully!"));
        toggleLoading(false);
      });
    }
  }

  @override
  Future<void> close() {
    phoneNumberController.dispose();
    return super.close();
  }
}
