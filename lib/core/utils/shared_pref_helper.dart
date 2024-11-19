import 'dart:convert';
import 'package:icar/core/localization/local_controller.dart';
import 'package:icar/features/auth/data/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  // Private constructor to prevent creating an instance of this class itself.
  PrefHelper._();
  static final PrefHelper instance = PrefHelper._();

  SharedPreferences? _prefs;
  final _secureStorage = const FlutterSecureStorage();
  var conversationId = '';

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }
void setBool(String key, bool value) {
    _prefs?.setBool(key, value);
  }

  bool getBool(String key) {
    return _prefs?.getBool(key) ?? false;
  }


  void setString(String key, String value) {
    _prefs?.setString(key, value);
  }


  String getString(String key) {
    return _prefs?.getString(key) ?? '';
  }

  void setLagChoosed(){
    _prefs?.setBool('LagChoosed',true);
  }
  bool getLagChoosed(){
    return _prefs?.getBool('LagChoosed') ?? false;
  }

  void setUserToken(String token) {
    _secureStorage.write(key: 'token', value: token);
  }

  Future<String> getUserToken() async {
    return await _secureStorage.read(key: 'token') ?? '';
  }

  void setLang(Lang lang) {
    _prefs?.setString('lang', lang.language.languageCode);
  }

  Lang getLang() {
    return language.firstWhere((element) =>
        element.language.languageCode ==
        (_prefs?.getString('lang') ?? language.first.language.languageCode));
  }
  void setLangCode(String langCode) {
    _prefs?.setString('langCode', langCode);
  }

  String getLangCode() {
    return _prefs?.getString('langCode') ?? 'en';
  }

  String getStoredConversation() {
    return conversationId;
  }

  void setStoredConversation(String conversation) {
    conversationId = conversation;
  }

  bool isLogin() {
    return _prefs?.getBool('isLogin') ?? false;
  }

  void setLogin(bool isLog) {
    _prefs?.setBool('isLogin', isLog);
  }

  int getUserId() {
    return _prefs?.getInt('userId') ?? getUser()?.id ?? 1;
  }

  void setUserId(int userId) {
    _prefs?.setInt('userId', userId);
  }

  void setUser(UserModel? user) {
    if (user != null) {
      _prefs?.setString('user', jsonEncode(user.toJson()));
    } else {
      _prefs?.remove('user');
    }
  }

  UserModel? getUser() {
    String? userString = _prefs?.getString('user');
    if (userString?.isNotEmpty??false) {
      return UserModel.fromJson(jsonDecode(userString!));
    }
    return null;
  }


  void clear() {
    _prefs?.clear();
  }

  void setSecuredString(String key, String value) {
    _secureStorage.write(key: key, value: value);
  }

  Future<String> getSecuredString(String key) async {
    return await _secureStorage.read(key: key) ?? '';
  }

  void clearAllSecuredData() {
    _secureStorage.deleteAll();
  }

  void setOAuthToken(String value) {
    _prefs?.setString('OAuthToken', value);
  }
  
  String? getOAuthToken() {
    return _prefs?.getString('OAuthToken');
  }
}
