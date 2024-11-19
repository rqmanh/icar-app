import 'package:icar/api/result/failures.dart';
import 'package:icar/api/result/success.dart';
import 'package:icar/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  // Future<Either<Failure, UserProfile>> signUp(String phoneNumber);
  Future<Either<Failure, Success>> sendOtp(String phoneNumber);
  Future<Either<Failure, UserModel>> verifyOtp(String phoneNumber, String otp);
  Future<Either<Failure, UserModel>> signUp(UserModel user);
  Future<void> signOut();
}
