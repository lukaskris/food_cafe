import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'shared/provider/local_auth_provider.dart';
import 'shared/repository/local_auth_repository.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<FlutterSecureStorage>(() => FlutterSecureStorage(), fenix: true);

    //SECURE STORAGE
    Get.lazyPut<LocalAuthProvider>(() => LocalAuthProvider(), fenix: true);
    Get.lazyPut<LocalAuthRepository>(() => LocalAuthRepository(), fenix: true);
  }
}
