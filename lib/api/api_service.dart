import 'dart:async';

import 'package:icar/core/utils/helper_controller.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart'; // For feedback

import 'api_constant.dart';
import 'result/api_error_strings.dart';
import 'api_response_model.dart';
import 'public_interceptor.dart';

class ApiService {
  final int connectTimeout = 60;
  late Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: Duration(seconds: connectTimeout),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        receiveDataWhenStatusError: true,
        
        validateStatus: (status) {
          if (status == 401) {
            // Handle unauthorized error

            Helper.errorSnackBar('Unauthorized');
            // PrefHelper.instance.clear();
            // PrefHelper.instance.clearAllSecuredData();
            // Get.offAll(AppRoutes.signinScreen, transition: Transition.fadeIn);
          }
          // if (status == 403) {
          //   // Handle forbidden error
          //   Helper.errorSnackBar('Your Account is banned, Please contact support');
   
          //   PrefHelper.instance.clear();
          //   PrefHelper.instance.clearAllSecuredData();
          //   Get.offAll(AppRoutes.signinScreen, transition: Transition.fadeIn);
            
          // }
          // Accept status codes between 200 and 429 inclusive
          return status != null && status >= 200 && status <= 429;
        },
      ),
    );

    _dio.interceptors.add(PublicInterceptor());
    _dio.interceptors.add(
      PrettyDioLogger(
        responseBody: true,
        requestBody: true,
        responseHeader: false,
      ),
    );
  }

  Future<ApiResponseModel> get(String path, [Object? data]) async {
    try {
      final response = await _dio
          .get(
            path,
            queryParameters: data as Map<String, dynamic>?,
          )
          .timeout(
            Duration(seconds: connectTimeout),
            onTimeout: () => _onTimeOut(),
          );

      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<ApiResponseModel> post(String path, Object? data) async {
    try {
      final response = await _dio
          .post(
            path,
            data: data,
          )
          .timeout(
            Duration(seconds: connectTimeout),
            onTimeout: () => _onTimeOut(),
          );

      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<ApiResponseModel> put(String path, Object? data) async {
    try {
      final response = await _dio
          .put(
            path,
            data: data,
          )
          .timeout(
            Duration(seconds: connectTimeout),
            onTimeout: () => _onTimeOut(),
          );

      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<ApiResponseModel> delete(String path) async {
    try {
      final response = await _dio
          .delete(
            path,
          )
          .timeout(
            Duration(seconds: connectTimeout),
            onTimeout: () => _onTimeOut(),
          );

      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<ApiResponseModel> postFormData(
    String path,
    FormData formData, {
    int maxRetries = 3,
  }) async {
    // final NotificationService notificationService = NotificationService();

    int retryCount = 0;
    while (retryCount < maxRetries) {
      try {
        // Show initial notification
        // notificationService.showProgressNotification(0);
        // EasyLoading.showProgress(0, status: 'Uploading');

        final response = await _dio.post(
          path,
          data: formData,
          onSendProgress: (sent, total) async {
            // if (total > 0) {
            //   double progress = ((sent / total) * 100);
            //   // Update notification progress
            //   EasyLoading.showProgress(
            //     progress / 100,
            //     status: 'Uploading ${progress.toStringAsFixed(0)}%',
            //   );
            // }
          },
        ).timeout(
          Duration(seconds: connectTimeout),
          onTimeout: () => _onTimeOut(),
        );

        // Dismiss notification after upload is complete
        // EasyLoading.dismiss();

        return _handleResponse(response);
      } on DioException catch (e) {
        retryCount++;
        EasyLoading.dismiss(); // Ensure loading is dismissed on error
        if (retryCount >= maxRetries) {
          return _handleDioError(e);
        } else {
          EasyLoading.showInfo('Retrying upload... ($retryCount/$maxRetries)');
          await Future.delayed(
              const Duration(seconds: 2)); // Delay before retry
        }
      }
    }
    EasyLoading.dismiss(); // Ensure loading is dismissed after retries
    return ApiResponseModel(
        status: false, message: 'Failed after multiple attempts.');
  }


  FutureOr<Response> _onTimeOut() {
    return Response(
      requestOptions: RequestOptions(path: ''),
      statusMessage: ApiErrorString.TIMEOUT_ERROR,
      statusCode: 408,
    );
  }

  ApiResponseModel _handleResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 422) {
      return ApiResponseModel.fromJson(response.data);
    } else {
      return ApiResponseModel(
        status: false,
        message: response.statusMessage ?? ApiErrorString.SERVER_ERROR,
      );
    }
  }

  ApiResponseModel _handleDioError(DioException e) {
    return ApiResponseModel(
      status: false,
      code: e.response?.statusCode.toString(),
      message: e.response?.statusMessage ?? ApiErrorString.SERVER_ERROR,
      errors: e.response?.data['errors'],
    );
  }
}
