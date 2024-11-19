
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:icar/api/dio_exception.dart';
import 'package:icar/core/network/network_info_plus.dart';

import 'api_response_model.dart';
import 'api_service.dart';
import 'result/api_error_strings.dart';
import 'result/failures.dart';
import 'package:dio/dio.dart' as di;




final networkInfoPlus = GetIt.I<NetworkInfoPlus>();

class ApiHelper {
  // Sends a request and handles the different HTTP methods dynamically
  static Future<ApiResponseModel> sendRequest({
    required String method,
    required String endpoint,
    Object? data,
    ProgressCallback? onSendProgress,
  }) async {
    ApiService dio = ApiService();
    ApiResponseModel response;

    try {
      // Handle different HTTP methods
      response = await _handleHttpRequest(dio, method, endpoint, data);
      
      // If successful, return the response
      if (response.status ?? false) {
        debugPrint('::: Success: $endpoint');
        return response;
      }

      debugPrint('::: Failure: $endpoint - ${response.message}');
      return response;

    } catch (e) {
      return _handleDioError(e); // Handle DioException or general errors
    }
  }

  // Handles various HTTP requests based on the method
  static Future<ApiResponseModel> _handleHttpRequest(
      ApiService dio, String method, String endpoint, Object? data) async {
    switch (method.toLowerCase()) {
      case 'get':
        return await dio.get(endpoint, data);
      case 'post':
        return await dio.post(endpoint, data);
      case 'put':
        return await dio.put(endpoint, data);
      case 'delete':
        return await dio.delete(endpoint);
      case 'post_form_data':
        return await dio.postFormData(endpoint, data as di.FormData);
      default:
        throw Exception('Invalid HTTP method: $method');
    }
  }

  // Handles Dio-specific exceptions using DioExceptions class
  static ApiResponseModel _handleDioError(dynamic e) {
    if (e is DioException) {
      // Use DioExceptions to get a custom message
      final dioError = DioExceptions.fromDioError(e);
      return ApiResponseModel(
        status: false,
        code: e.response?.statusCode.toString(),
        message: dioError.message, // Return the custom error message
        errors: e.response?.data['errors'],
      );
    }

    // Handle any other types of exceptions
    return ApiResponseModel(
      status: false,
      message: 'An error occurred: ${e.toString()}',
    );
  }

  // Improved method to handle network failures and function failures
  static Future handleFunctionFailure(Future<ApiResponseModel> Function() functionToImplement) async {
    try {
      if (await _isNetworkConnected()) {
        return await functionToImplement();
      } else {
        return OfflineFailure(message: ApiErrorString.OFFLINE_ERROR);
      }
    } catch (e) {
      if (e is Failure) {
        return e; // Return custom failure
      }
      return NotSpecificFailure(message: 'Error occurred: ${e.toString()}');
    }
  }

  // Utility method to check network connectivity
  static Future<bool> _isNetworkConnected() async {
    return await networkInfoPlus.isConnected;
  }
}
