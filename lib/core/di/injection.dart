
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
import 'package:icar/features/auth/presentation/cubit/otp_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Register Dio
  getIt.registerLazySingleton<Dio>(
      () => Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)));
// Register ApiHelper
  getIt.registerLazySingleton<ApiHelper>(() => ApiHelper());
  // Register SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Register FlutterSecureStorage
  getIt.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage());

  // Register ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  // getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfo());
  getIt.registerLazySingleton<NetworkInfoPlus>(() => NetworkInfoPlus());

  // Register AuthLocalDataSource
  getIt.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSource());

  // Register AuthRemoteDataSource
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(dio: getIt<ApiService>()));

  // Register AuthRepository
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        networkInfo: getIt<NetworkInfoPlus>(),
        networkInfoPlus: getIt<NetworkInfoPlus>(),
        remoteDataSource: getIt<AuthRemoteDataSource>(),
        localDataSource: getIt<AuthLocalDataSource>(),
      ));

  // Register UseCases
  getIt.registerLazySingleton<SendOtpUseCase>(
      () => SendOtpUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton<VerifyOtpUseCase>(
      () => VerifyOtpUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(getIt<AuthRepository>()));



  // Register CacheManager
  // sl.registerLazySingleton<CacheManager>(() => DefaultCacheManager());





  // Register Cubit as a Factory to create a new instance when needed
  getIt.registerFactory(() => OtpCubit(
    sendOtpUseCase: getIt<SendOtpUseCase>(),
    verifyOtpUseCase: getIt<VerifyOtpUseCase>(),
  ));

  await getIt.allReady();
}
