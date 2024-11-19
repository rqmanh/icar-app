import 'dart:io';

import 'package:icar/api/api_constant.dart';
import 'package:icar/api/api_helper.dart';
import 'package:icar/api/api_response_model.dart';
import 'package:icar/api/api_service.dart';
import 'package:icar/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
FirebaseMessaging messaging = FirebaseMessaging.instance;
class AuthRemoteDataSource {
  final ApiService dio;

  AuthRemoteDataSource({required this.dio});

  Future<ApiResponseModel> sendOtp(String mobileNumber) async {
    ApiResponseModel response =
        await dio.post(ApiConstants.sendOtp, {'mobile_number': mobileNumber});
    return _handleApiResponse(response);
  }

  Future<ApiResponseModel> verifyOtp(String phoneNumber, String otp) async {

    // NotificationService notificationService = NotificationService();
    // String? deviceToken = await notificationService.getToken();

    // print('device token : $deviceToken');
    // print('device token : $deviceToken');
    ApiResponseModel response = await ApiHelper.sendRequest(
      method: 'post',
      endpoint: ApiConstants.login,
      data: {'mobile_number': phoneNumber, 'mobile_verify_code': otp,},

    );
    return _handleApiResponse(response);
  }

  Future<ApiResponseModel> signUp(UserModel user) async {
    try {
      FormData formData = FormData();

      // formData.fields.addAll({
      //   MapEntry('name', user.name ?? ''),
      //   MapEntry('username', '@${user.username?? ''}'),
      //   MapEntry('nick_name', user.nickname ?? ''),
      //   MapEntry('mobile_number', user.mobileNumber ?? ''),
      //   MapEntry('gender', user.gender.toString()),
      //   MapEntry('birth_date', user.birthDate ?? ''),
      //   MapEntry('bio', user.bio ?? ''),
      //   MapEntry('email', user.email ?? ''),
      // });

      // if (user.avatar != null && user.avatar!.isNotEmpty) {
      //   formData.files.add(MapEntry(
      //     'avatar',
      //     await MultipartFile.fromFile(
      //       user.avatar!,
      //       filename: user.avatar!.split('/').last,
      //     ),
      //   ));
      // }

      // Send request using ApiHelper or Dio instance
      ApiResponseModel response = await ApiHelper.sendRequest(
        method: 'post',
        endpoint: ApiConstants.signUp,
        data: formData,
      );

      return _handleApiResponse(response);
    } on DioException catch (e) {
      // Handle Dio errors (e.g., network issues, timeouts)
      throw SocketException('Failed to sign up: ${e.message}');
    } catch (e) {
      // Handle other exceptions
      throw Exception('Failed to sign up: $e');
    }
  }

  Future<ApiResponseModel> signOut() async {
    ApiResponseModel response =await ApiHelper.sendRequest(
      method: 'post',
      endpoint: ApiConstants.logout,
    );
    return _handleApiResponse(response);
  }

  ApiResponseModel _handleApiResponse(ApiResponseModel response) {
    if (response.status ?? false) {
      return response;
    } else {
      return ApiResponseModel(
        status: false,
        message: response.message ?? 'Unknown error',
        errors: response.errors,
      );
    }
  }
}
