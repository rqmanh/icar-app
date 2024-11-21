import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icar/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:icar/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:icar/features/auth/presentation/cubit/otp_state.dart';
class OtpCubit extends Cubit<OtpState> {
  final SendOtpUseCase sendOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  Timer? _timer;

  OtpCubit({
    required this.sendOtpUseCase,
    required this.verifyOtpUseCase,
  }) : super(OtpState());

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    emit(state.copyWith(remainingSeconds: 60));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingSeconds > 0) {
        emit(state.copyWith(remainingSeconds: state.remainingSeconds - 1));
      } else {
        _timer!.cancel();
      }
    });
  }

  void sendOtp(String phoneNumber) async {
    emit(state.copyWith(isLoading: true));
    final result = await sendOtpUseCase(phoneNumber);

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: 'Failed to send OTP.'));
      },
      (success) {
        emit(state.copyWith(isLoading: false));
        startTimer();
      },
    );
  }

  void verifyOtp(String otp) async {
    emit(state.copyWith(isLoading: true));
    final result = await verifyOtpUseCase(otp,'');

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: 'OTP verification failed.'));
      },
      (user) {
        emit(state.copyWith(isLoading: false));
        // Handle successful verification, e.g., save token or navigate
      },
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}