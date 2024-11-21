import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
 final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
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
  
  @override
  Future<Either<Failure, UserModel>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }





//  @override
//   Future<Either<Failure, UserModel>> signInWithGoogle() async {
//     bool isConnected = await networkInfo.isConnected;
//     if (!isConnected) {
//       return Left(OfflineFailure(message: ApiErrorString.OFFLINE_ERROR));
//     }

//     try {
//       // Step 1: Trigger Google Sign-In
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) {
//         return const Left(ServerFailure(message: 'Google Sign-In canceled'));
//       }

//       // Step 2: Get the authentication details from Google
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         idToken: googleAuth.idToken,
//         accessToken: googleAuth.accessToken,
//       );

//       // Step 3: Sign in to Firebase using the credentials
//       final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
//       final firebaseUser = userCredential.user;
      
//       if (firebaseUser == null) {
//         return const Left(ServerFailure(message: 'Failed to sign in with Google'));
//       }

//       // Step 4: Send the idToken to the backend for validation or user creation
//       final response = await remoteDataSource.signInWithGoogle(firebaseUser);

//       if (response.status == true) {
//         // Backend response with user data
//         final userModelData = response.data as Map<String, dynamic>;
//         final userModel = UserModel.fromJson(userModelData);

//         // Step 5: Save user data and token locally
//         PrefHelper.instance.setSecuredString('token', userModel.token); // Assuming token comes from backend
//         PrefHelper.instance.setUser(userModel);
        
//         return Right(userModel);
//       } else {
//         return Left(ServerFailure(
//             message: ResponseCodeUtils.getCode(response.code ?? 'Unknown error'),
//             code: ResponseCodeUtils.getCode(response.code ?? ''),
//             errors: ResponseCodeUtils.getErrorMessage(
//                 response.errors, response.message ?? '')));
//       }
//     } catch (e) {
//       return Left(ServerFailure(message: e.toString()));
//     }
//   }




}
