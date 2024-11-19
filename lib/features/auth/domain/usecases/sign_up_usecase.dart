import 'package:icar/api/result/failures.dart';
import 'package:icar/features/auth/data/models/user_model.dart';
import 'package:icar/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<Failure, UserModel>> call(UserModel profile) {
    return repository.signUp(profile);
  }
}
