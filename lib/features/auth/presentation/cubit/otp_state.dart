class OtpState {
  final String verificationCode;
  final int remainingSeconds;
  final bool isLoading;
  final String errorMessage;

  OtpState({
    this.verificationCode = '',
    this.remainingSeconds = 60,
    this.isLoading = false,
    this.errorMessage = '',
  });

  OtpState copyWith({
    String? verificationCode,
    int? remainingSeconds,
    bool? isLoading,
    String? errorMessage,
  }) {
    return OtpState(
      verificationCode: verificationCode ?? this.verificationCode,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
