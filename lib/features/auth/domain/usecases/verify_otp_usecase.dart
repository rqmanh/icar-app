import 'package:icar/api/result/failures.dart';
import 'package:icar/features/auth/data/models/user_model.dart';

import 'package:icar/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<Either<Failure, UserModel>> call(String phoneNumber, String otp) {
    return repository.verifyOtp(phoneNumber, otp);
  }
}

// import 'package:icar/features/authentication/domain/entities/auth_user.dart';
// import 'package:icar/features/authentication/domain/repositories/auth_repository.dart';


// class VerifyOtpUseCase {
//   final AuthRepository _authRepository;

//   VerifyOtpUseCase(this._authRepository);

//   Future<AuthUserEntity> call(String phoneNumber, String otp) async {
//     return await _authRepository.verifyOtp(phoneNumber, otp);
//   }
// }
