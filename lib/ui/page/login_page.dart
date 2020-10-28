import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/controller/login_controller.dart';
import 'package:food_cafe/resource/colors.dart';
import 'package:food_cafe/resource/images.dart';
import 'package:food_cafe/resource/style.dart';
import 'package:food_cafe/resource/value.dart';
import 'package:food_cafe/ui/clipper/login_clipper.dart';
import 'package:get/get.dart';
import 'package:food_cafe/utils/extensions.dart';
import 'package:line_icons/line_icons.dart';

class LoginPage extends StatefulWidget {
  @override
  createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final LoginController _loginController = Get.put(LoginController());

  final GlobalKey<FormState> _key = GlobalKey();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => FancyBackground(
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: new Form(
                  key: _key,
                  child: ListView(children: [_formUI()]))));

  _formUI() => Obx(() => Container(
        padding: EdgeInsets.all(20),
        child: Column(children: <Widget>[
          widget.size(heightScale: 100.0),
          _formIcon(),
          widget.size(heightScale: 30.0),
          _emailInput(),
          _passwordInput(),
          widget.size(heightScale: 20.0),
          _loginPress(),
          SizedBox(height: 10.0),
          _login()
        ])));

  _login() => Column(children: <Widget>[
        RawMaterialButton(
            padding: const EdgeInsets.all(10),
            child:
                Text(linkForgotPassword, style: loginLinkStyle(linkColor)),
            onPressed: () {}),
        SizedBox(height: 30.0),
        SizedBox(height: 10.0),
        _socialLogin(),
        SizedBox(height: 20.0),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(labelSignUp, style: doNotHaveAccountStyle(Colors.black)),
          RawMaterialButton(
              padding: EdgeInsets.all(10),
              child: Text(linkSignUp, style: loginLinkStyle(linkColor)),
              onPressed: () => {})
        ])
      ]);

  _formIcon() => Center(
      child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(appIconImage)));

  _loginPress() => Align(alignment: Alignment.bottomCenter).customFloatForm(
      color: appBarTitleColor,
      stateStatus: _loginController.stateStatus,
      icon: Icons.navigate_next,
      isMini: false,
      qrCallback: () => _loginValidate());

  _loginValidate() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      _loginController.callLogin();
    } else {
      _loginController.callLogin();
      //_loginController.checkAutoValidate();
    }
  }

  _socialLogin() => Container(
      height: 60,
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        widget.socialIcon(
            icon: Icon(LineIcons.google, color: Colors.white, size: 25),
            backgroundColor: Colors.red,
            voidCallback: () {}),
        SizedBox(width: 30),
        widget.socialIcon(
            icon:
                Icon(LineIcons.facebook, color: Colors.white, size: 25),
            backgroundColor: Colors.blue,
            voidCallback: () {}),
      ]));

  _emailInput() => widget.inputField(
        _emailController,
        validation: _loginController.isEmailValid,
        onChanged: _loginController.changeUserName,
        labelText: hintEmail,
        keyboardType: TextInputType.emailAddress,
      );

  _passwordInput() => widget.inputField(_passwordController,
      labelText: hintPassword,
      validation: _loginController.isPasswordValid,
      obscureText: _loginController.passwordVisible.value,
      onChanged: _loginController.changePassword,
      maxLength: 55,
      inkWell: InkWell(
          child: Icon(_loginController.passwordVisible.value
              ? Icons.visibility_off
              : Icons.visibility),
          onTap: () => _loginController.togglePasswordVisibility()));
}
