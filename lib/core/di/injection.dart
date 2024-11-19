
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:icar/api/api_constant.dart';
import 'package:icar/api/api_helper.dart';
import 'package:icar/api/api_service.dart';
import 'package:icar/core/network/network_info_plus.dart';
import 'package:icar/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:icar/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:icar/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:icar/features/auth/domain/repositories/auth_repository.dart';
import 'package:icar/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:icar/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:icar/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  // Register Dio
  sl.registerLazySingleton<Dio>(
      () => Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)));
// Register ApiHelper
  sl.registerLazySingleton<ApiHelper>(() => ApiHelper());
  // Register SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  // Register FlutterSecureStorage
  sl.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage());

  // Register ApiService
  sl.registerLazySingleton<ApiService>(() => ApiService());
  // getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfo());
  sl.registerLazySingleton<NetworkInfoPlus>(() => NetworkInfoPlus());

  // Register AuthLocalDataSource
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSource());

  // Register AuthRemoteDataSource
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(dio: sl<ApiService>()));

  // Register AuthRepository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        networkInfo: sl<NetworkInfoPlus>(),
        networkInfoPlus: sl<NetworkInfoPlus>(),
        remoteDataSource: sl<AuthRemoteDataSource>(),
        localDataSource: sl<AuthLocalDataSource>(),
      ));

  // Register UseCases
  sl.registerLazySingleton<SendOtpUseCase>(
      () => SendOtpUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton<VerifyOtpUseCase>(
      () => VerifyOtpUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(sl<AuthRepository>()));



  // Register CacheManager
  // sl.registerLazySingleton<CacheManager>(() => DefaultCacheManager());




  await sl.allReady();
}
