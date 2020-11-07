import 'package:food_cafe/shared/provider/local_auth_provider.dart';
import 'package:get/get.dart';

class LocalAuthRepository {
  final LocalAuthProvider _localAuthProvider = Get.find<LocalAuthProvider>();

  Future<void> clearSession() => _localAuthProvider.clearSession();

  Future<String> getSession(String key) => _localAuthProvider.getSession(key);

  Future<void> setSession(String key, String value) => _localAuthProvider.setSession(key, value);
}
