import 'package:icar/api/dio_exception.dart';
import 'package:icar/api/result/api_error_strings.dart';
import 'package:icar/api/result/failures.dart';
import 'package:icar/api/result/success.dart';
import 'package:icar/core/network/network_info_plus.dart';
import 'package:icar/core/utils/shared_pref_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:icar/features/auth/domain/repositories/auth_repository.dart';
import 'package:icar/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:icar/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:icar/features/auth/data/models/user_model.dart';
import 'dart:io';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfoPlus networkInfo;
  final NetworkInfoPlus networkInfoPlus;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
    required this.networkInfoPlus,
  });

  @override
  Future<Either<Failure, Success>> sendOtp(String phoneNumber) async {
    bool isConnected = await networkInfoPlus.isConnected;
    if (isConnected) {
      try {
        final response = await remoteDataSource.sendOtp(phoneNumber);
        if (response.status == true) {
          return const Right(ServerSuccess('OTP sent successfully'));
        } else {
          return Left(ServerFailure(
              message:
                  ResponseCodeUtils.getCode(response.code ?? 'Unknown error'),
              code: ResponseCodeUtils.getCode(response.code ?? ''),
              errors: ResponseCodeUtils.getErrorMessage(
                  response.errors, response.code ?? '')));
        }
      } on DioExceptions catch (e) {
        return Left(ServerFailure(message: e.message));
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    }
    return Left(OfflineFailure(message: ApiErrorString.OFFLINE_ERROR));
  }

  @override
  Future<Either<Failure, UserModel>> verifyOtp(
      String phoneNumber, String otp) async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final response = await remoteDataSource.verifyOtp(phoneNumber, otp);

        if (response.status == true) {
          final userModelData = response.data as Map<String, dynamic>;
          final userModel = UserModel.fromJson(userModelData);
          if (response.data['token'] != null) {
            // PrefHelper.instance.setUser(userModel);
            PrefHelper.instance
                .setSecuredString('token', response.data['token']!);

            PrefHelper.instance.setUser(userModel);
            return Right(userModel);
          } else {
            return const Left(ServerFailure(message: 'Unknown error'));
          }
        } else {
          return Left(ServerFailure(
              message:
                  ResponseCodeUtils.getCode(response.code ?? 'Unknown error'),
              code: ResponseCodeUtils.getCode(response.code ?? ''),
              errors: ResponseCodeUtils.getErrorMessage(
                  response.errors, response.message ?? '')));
        }
      } on DioExceptions catch (e) {
        return Left(ServerFailure(message: e.message));
      } on SocketException catch (_) {
        return Left(ServerFailure(message: ApiErrorString.SOCKET_ERROR));
      } catch (e) {
        print('===========$e');
        return Left(ServerFailure(message: e.toString()));
      }
    }
    return Left(OfflineFailure(message: ApiErrorString.OFFLINE_ERROR));
  }

  @override
  Future<Either<Failure, UserModel>> signUp(UserModel user) async {
    try {
      final response = await remoteDataSource.signUp(user);
      // PrefHelper.instance.getSecuredString('token');
      if (response.status == true) {
        final userModelData = response.data as Map<String, dynamic>;
        final userModel = UserModel.fromJson(userModelData);

        PrefHelper.instance.setUser(userModel);
        PrefHelper.instance.setUserId(userModel.id);

        return Right(userModel);
      } else {
        return Left(ServerFailure(
            message:
                ResponseCodeUtils.getCode(response.code ?? 'Unknown error'),
            code: ResponseCodeUtils.getCode(response.code ?? ''),
            errors: ResponseCodeUtils.getErrorMessage(
                response.errors, response.message ?? '')));
      }
    } on DioExceptions catch (e) {
      return Left(ServerFailure(message: e.message));
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Success>> signOut() async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        await remoteDataSource.signOut();
        await localDataSource.clearAllData();
        PrefHelper.instance.clear();
        PrefHelper.instance.clearAllSecuredData();
        return const Right(ServerSuccess('Signed out successfully'));
      } on DioExceptions catch (e) {
        return Left(ServerFailure(message: e.message));
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    }
    return Left(OfflineFailure(message: ApiErrorString.OFFLINE_ERROR));
  }
}
