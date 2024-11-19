// lib/features/auth/data/datasources/auth_local_data_source.dart

import 'package:icar/core/utils/shared_pref_helper.dart';

class AuthLocalDataSource {
  static const _tokenKey = 'TOKEN_KEY';

  Future<void> saveToken(String token) async {
    PrefHelper.instance.setSecuredString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    return PrefHelper.instance.getSecuredString(_tokenKey);
  }

  Future<void> clearAllData() async {
    PrefHelper.instance.clearAllSecuredData();
  }
}
