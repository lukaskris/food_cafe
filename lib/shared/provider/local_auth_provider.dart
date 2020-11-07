import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_cafe/resource/api.dart';
import 'package:get/get.dart';

class LocalAuthProvider {
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  clearSession() {
    _storage.delete(key: SECURE_STORAGE_USERNAME);
    _storage.delete(key: SECURE_STORAGE_EMAIL);
    _storage.delete(key: SECURE_STORAGE_PROFILE_URL);
    _storage.delete(key: SECURE_STORAGE_USER_ID);
    _storage.delete(key: SECURE_STORAGE_TOKEN);
  }

  Future<void> setSession(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String> getSession(String key) async {
    final sessionData = await _storage.read(key: key);
    if (sessionData != null) {
      return sessionData;
    }
    return null;
  }
}
