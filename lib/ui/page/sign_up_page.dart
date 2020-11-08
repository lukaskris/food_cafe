import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/controller/controller.dart';
import 'package:food_cafe/resource/colors.dart';
import 'package:food_cafe/resource/images.dart';
import 'package:food_cafe/resource/value.dart';
import 'package:get/get.dart';
import 'package:food_cafe/utils/extensions.dart';
import 'package:line_icons/line_icons.dart';

class SignUpPage extends StatefulWidget {
  @override
  createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final SingUpController _singUpController = Get.put(SingUpController());

  final GlobalKey<FormState> _key = GlobalKey();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _key,
          child: ListView(children: [_formUI()])));

  _formUI() => Obx(() => Container(
      padding: EdgeInsets.all(20),
      child: Column(children: <Widget>[
        widget.size(heightScale: 100.0),
        _formIcon(),
        widget.size(heightScale: 30.0),
        _userNameInput(),
        _emailInput(),
        _passwordInput(),
        _confirmPassword(),
        _mobileInput(),
        widget.size(heightScale: 20.0),
        _loginPress(),
        SizedBox(height: 10.0),
      ])));

  _formIcon() => Center(
      child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(appIconImage)));

  _loginPress() => Align(alignment: Alignment.bottomCenter).customFloatForm(
      color: appBarTitleColor,
      stateStatus: _singUpController.stateStatus.value,
      icon: Icons.navigate_next,
      isMini: false,
      qrCallback: () => _loginValidate());

  _loginValidate() {
    FocusScope.of(context).requestFocus(FocusNode());

    if (_key.currentState.validate()) {
      _key.currentState.save();
      _singUpController.callLogin();
    } else {
      _singUpController.checkAutoValidate();
    }
  }

  _userNameInput() => widget.inputField(
    _singUpController.userNameController,
        validation: _singUpController.isUserNameValid,
        onChanged: _singUpController.changeUserName,
        labelText: hintUserName,
        keyboardType: TextInputType.text,
      );

  _emailInput() => widget.inputField(
    _singUpController.emailController,
        validation: _singUpController.isEmailValid,
        onChanged: _singUpController.changeEmail,
        labelText: hintEmail,
        keyboardType: TextInputType.emailAddress,
      );

  _passwordInput() => widget.inputField(_singUpController.passwordController,
      labelText: hintPassword,
      validation: _singUpController.isPasswordValid,
      obscureText: _singUpController.passwordVisible.value,
      onChanged: _singUpController.changePassword,
      maxLength: 55,
      inkWell: InkWell(
          child: Icon(_singUpController.passwordVisible.value
              ? passwordInVisibleIcon
              : passwordVisibleIcon),
          onTap: () => _singUpController.togglePasswordVisibility()));

  _confirmPassword() =>
      widget.inputField(_singUpController.confirmPasswordController, labelText: hintConfirmPassword,
          validation: (confirmation) {
        return confirmation.isEmpty
            ? 'Confirm password is required'
            : confirmation == _singUpController.passwordController.text
                ? null
                : 'Password and confirm password not match';
      },
          obscureText: _singUpController.passwordVisible.value,
          onChanged: _singUpController.changeConfirmPassword,
          maxLength: 55,
          inkWell: InkWell(
              child: Icon(_singUpController.passwordVisible.value
                  ? passwordInVisibleIcon
                  : passwordVisibleIcon),
              onTap: () => _singUpController.togglePasswordVisibility()));

  _mobileInput() => widget.inputField(
    _singUpController.mobileController,
        validation: _singUpController.isMobileValid,
        onChanged: _singUpController.changeMobile,
        labelText: hintMobile,
        keyboardType: TextInputType.number,
      );
}
