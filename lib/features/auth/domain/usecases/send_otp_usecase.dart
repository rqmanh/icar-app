// lib/auth/domain/usecases/send_otp_usecase.dart
import 'package:icar/api/result/failures.dart';
import 'package:icar/api/result/success.dart';
import 'package:dartz/dartz.dart';

import '../repositories/auth_repository.dart';

class SendOtpUseCase {
  final AuthRepository repository;

  SendOtpUseCase(this.repository);

  Future<Either<Failure, Success>> call(String phoneNumber) {
    return repository.sendOtp(phoneNumber);
  }
}
