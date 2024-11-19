import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void setPhoneNumber(String phoneNumber) {
    emit(state.copyWith(phoneNumber: phoneNumber));
  }

  void toggleTermsAndConditions(bool isChecked) {
    emit(state.copyWith(isTermsChecked: isChecked));
  }

  void sendOtp() {
    emit(state.copyWith(isLoading: true));
    // simulate sending OTP logic
    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(isLoading: false));
      // Handle OTP sending result here
    });
  }
}

class LoginState {
  final String phoneNumber;
  final bool isTermsChecked;
  final bool isLoading;

  LoginState({
    this.phoneNumber = '',
    this.isTermsChecked = false,
    this.isLoading = false,
  });

  LoginState copyWith({
    String? phoneNumber,
    bool? isTermsChecked,
    bool? isLoading,
  }) {
    return LoginState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isTermsChecked: isTermsChecked ?? this.isTermsChecked,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
