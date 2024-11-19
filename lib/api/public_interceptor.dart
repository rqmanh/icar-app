import 'package:icar/core/utils/shared_pref_helper.dart';
import 'package:dio/dio.dart';


import 'api_constant.dart';

class PublicInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers = ApiConstants.headers;
    var authToken = await PrefHelper.instance.getSecuredString('token');
    if (authToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $authToken';
      options.headers['Accept-Language'] = PrefHelper.instance.getLangCode();
    }
    return super.onRequest(options, handler);
  }
}
