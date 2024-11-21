import 'package:dartz/dartz.dart';
import 'package:icar/api/result/failures.dart';
import 'package:icar/features/auth/data/models/user_model.dart';
import 'package:icar/features/auth/domain/repositories/auth_repository.dart';

class SignInWithGoogleUsecase {
  final AuthRepository repository;

  SignInWithGoogleUsecase(this.repository);

  Future<Either<Failure, UserModel>> call() {
    return repository.signInWithGoogle();
  }
}