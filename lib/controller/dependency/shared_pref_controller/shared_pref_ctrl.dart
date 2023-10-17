import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends GetxController {
  static SharedPref get find => Get.find();

  SharedPreferences? _prefs;
  static const String _tokenKey = 'auth_token';
  static const String _firstTime = 'isFirstTime';
  static const String _otpVerified = 'otpVerified';

  Future<SharedPreferences> get prefs async =>
      _prefs ??= await SharedPreferences.getInstance();

  Future<String?> getToken() async {
    final prefs = await this.prefs;
    return prefs.getString(_tokenKey);
  }

  Future<void> setToken(String token) async {
    final prefs = await this.prefs;
    await prefs.setString(_tokenKey, token);
  }

  Future<bool?> getFirstTime() async {
    final prefs = await this.prefs;
    return prefs.getBool(_firstTime);
  }

  Future<bool?> getOtpVerification() async {
    final prefs = await this.prefs;
    return prefs.getBool(_otpVerified);
  }

  Future<void> setFirstTime(bool isFirst) async {
    final prefs = await this.prefs;
    await prefs.setBool(_firstTime, isFirst);
  }

  Future<void> setOtpVerfication(bool otpDone) async {
    final prefs = await this.prefs;
    await prefs.setBool(_otpVerified, otpDone);
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('userType');
    await prefs.remove('busiType');
    await prefs.remove("userimage");
    await prefs.remove(_otpVerified);
    logout();
  }

  Future<String?> getString(String key) async {
    final prefs = await this.prefs;
    return prefs.getString(key);
  }

  Future<void> setString(String key, String value) async {
    final prefs = await this.prefs;
    await prefs.setString(key, value);
  }

  Future<void> removePref(String key) async {
    final prefs = await this.prefs;
    await prefs.remove(key);
  }

  Future<void> setBool(String key, bool value) async {
    final prefs = await this.prefs;
    await prefs.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    final prefs = await this.prefs;
    return prefs.getBool(key);
  }

  logout() {}
}
