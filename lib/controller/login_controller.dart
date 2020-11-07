import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_cafe/resource/api.dart';
import 'package:food_cafe/resource/routes.dart';
import 'package:food_cafe/resource/value.dart';
import 'package:food_cafe/shared/repository/local_auth_repository.dart';
import 'package:food_cafe/utils/extensions.dart';
import 'package:food_cafe/utils/state_status.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  Rx<StateStatus> stateStatus = StateStatus.INITIAL.obs;

  String _email = '', _password = '';

  RxBool autoValidate = false.obs;
  RxBool passwordVisible = true.obs;

  final secureStorageUserName = ''.obs;
  final secureStorageProfileURL = ''.obs;
  final secureStorageEmail = ''.obs;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  changeUserName(String value) {
    _email = value;
  }

  changePassword(String value) {
    _password = value;
  }

  checkAutoValidate() {
    autoValidate.value = true;
  }

  togglePasswordVisibility() {
    this.passwordVisible.value = !passwordVisible.value;
  }

  Future<void> callLogin() async {
    stateStatus.value = StateStatus.LOADING;

    _localAuthRepository.setSession(SECURE_STORAGE_USERNAME, developerName);
    _localAuthRepository.setSession(SECURE_STORAGE_EMAIL, developerEmail);
    _localAuthRepository.setSession(SECURE_STORAGE_PROFILE_URL, '');
    _localAuthRepository.setSession(SECURE_STORAGE_TOKEN, '');
    _localAuthRepository.setSession(SECURE_STORAGE_USER_ID, '');

    stateStatus.value = StateStatus.SUCCESS;

    Get.offNamed(homeRoute);
  }

  Future<void> callGoogleLogin() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _firebaseAuth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      final User user = _firebaseAuth.currentUser;

      _localAuthRepository.setSession(SECURE_STORAGE_USERNAME, user.displayName);
      _localAuthRepository.setSession(SECURE_STORAGE_EMAIL, user.email);
      _localAuthRepository.setSession(SECURE_STORAGE_PROFILE_URL, user.photoURL);
      _localAuthRepository.setSession(SECURE_STORAGE_TOKEN, user.refreshToken);
      _localAuthRepository.setSession(SECURE_STORAGE_USER_ID, user.uid);

      Get.offNamed(homeRoute);
    }
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

    await _localAuthRepository
        .getSession(SECURE_STORAGE_EMAIL)
        .then((value) {
      secureStorageEmail.value = value;
    });
  }

  Future<void> logout() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    _localAuthRepository.clearSession();

    secureStorageUserName.value = '';
    secureStorageProfileURL.value = '';
    secureStorageEmail.value = '';

    Get.offAllNamed(loginRoute);
  }

  String isPasswordValid(String value) => value.validatePassword();

  String isEmailValid(String value) => value.validateEmail();
}
