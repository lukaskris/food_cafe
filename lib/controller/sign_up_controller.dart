import 'package:flutter/cupertino.dart';
import 'package:food_cafe/resource/api.dart';
import 'package:food_cafe/resource/routes.dart';
import 'package:food_cafe/resource/value.dart';
import 'package:food_cafe/shared/repository/local_auth_repository.dart';
import 'package:food_cafe/utils/extensions.dart';
import 'package:food_cafe/utils/state_status.dart';
import 'package:get/get.dart';

class SingUpController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  Rx<StateStatus> stateStatus = StateStatus.INITIAL.obs;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  String _userName = '',
      _email = '',
      _password = '',
      _confirmPassword = '',
      _mobile = '';

  RxBool autoValidate = false.obs;
  RxBool passwordVisible = true.obs;

  final secureStorageUserName = ''.obs;
  final secureStorageProfileURL = ''.obs;
  final secureStorageEmail = ''.obs;

  changeUserName(String value) {
    _userName = value;
  }

  changeEmail(String value) {
    _email = value;
  }

  changePassword(String value) {
    _password = value;
  }

  changeConfirmPassword(String value) {
    _confirmPassword = value;
  }

  changeMobile(String value) {
    _mobile = value;
  }

  checkAutoValidate() {
    autoValidate.value = true;
  }

  togglePasswordVisibility() {
    this.passwordVisible.value = !passwordVisible.value;
  }

  Future<void> callLogin() async {
    stateStatus.value = StateStatus.LOADING;

    _localAuthRepository.setSession(SECURE_STORAGE_USERNAME, _userName);
    _localAuthRepository.setSession(SECURE_STORAGE_EMAIL, _email);
    _localAuthRepository.setSession(SECURE_STORAGE_PROFILE_URL, '');
    _localAuthRepository.setSession(SECURE_STORAGE_TOKEN, '');
    _localAuthRepository.setSession(SECURE_STORAGE_USER_ID, '');

    stateStatus.value = StateStatus.SUCCESS;

    _clearTextField();
    Get.offNamed(homeRoute);
  }

  Future<void> getUserName() async {
    await _localAuthRepository
        .getSession(SECURE_STORAGE_USERNAME)
        .then((value) {
      secureStorageUserName.value = value;
    });

    await _localAuthRepository
        .getSession(SECURE_STORAGE_PROFILE_URL)
        .then((value) {
      secureStorageProfileURL.value = value;
    });

    await _localAuthRepository.getSession(SECURE_STORAGE_EMAIL).then((value) {
      secureStorageEmail.value = value;
    });
  }

   _clearTextField(){
    userNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    mobileController.clear();
  }

  String isUserNameValid(String value) => value.validUserName();

  String isPasswordValid(String value) => value.validatePassword();

  String isEmailValid(String value) => value.validateEmail();

  String isMobileValid(String value) => value.validateMobile();
}
