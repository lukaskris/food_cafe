import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/resource/colors.dart';
import 'package:food_cafe/resource/font.dart';
import 'package:food_cafe/resource/style.dart';
import 'package:food_cafe/ui/widget/icon_shadow.dart';
import 'state_status.dart';

extension ContextExtensions on BuildContext {
  double widthInPercent(double percent) {
    var toDouble = percent / 100;
    return MediaQuery.of(this).size.width * toDouble;
  }

  double heightInPercent(double percent) {
    var toDouble = percent / 100;
    return MediaQuery.of(this).size.height * toDouble;
  }

  showProgress(Color color) {
    showDialog(
        context: this,
        barrierDismissible: false,
        builder: (context) => Container(
            alignment: FractionalOffset.center,
            child: CircularProgressIndicator(strokeWidth: 1)));
  }

  void hideProgress() {
    Navigator.pop(this);
  }

  void toast({String message}) {
    Flushbar(
      boxShadows: [
        BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0)
      ],
      margin: EdgeInsets.all(0),
      borderRadius: 0,
      backgroundColor: backgroundColor,
      messageText: Text(message, style: flushBarMessageStyle),
      duration: Duration(seconds: 3),
    )..show(this);
  }
}

extension ValiationExtensions on String {
  validateEmail() {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (this.isEmpty) {
      return 'Email is required';
    } else if (!regExp.hasMatch(this)) {
      return 'Invalid email';
    } else {
      return null;
    }
  }

  validatePassword() {
    if (this.isEmpty) {
      return 'Password is required';
    } else if (this.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  validateMobile() {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (this.replaceAll(" ", "").isEmpty) {
      return 'Mobile is required';
    } else if (this.replaceAll(" ", "").length != 10) {
      return 'Mobile number must 10 digits';
    } else if (!regExp.hasMatch(this.replaceAll(" ", ""))) {
      return 'Mobile number must be digits';
    }
    return null;
  }

  String validUserName() {
    String pattern = r'(^[a-zA-Z]*$)';
    RegExp regExp = RegExp(pattern);
    if (this.isEmpty) {
      return 'Name is required';
    } else if (!regExp.hasMatch(this)) {
      return 'Name must be a-z and A-Z';
    }
    return null;
  }

  bool validationEqual(String currentValue, String checkValue) {
    if (currentValue == checkValue) {
      return true;
    } else {
      return false;
    }
  }
}

/*
 Text('').padding(EdgeInsets.only(bottom: (12)))
 Container(child: Text('f')).cardView(EdgeInsets.all(12), EdgeInsets.all(12)),
 Center(child: Image.asset('assets/images/.png', color: Colors.grey, height: 30)).circleAvatar();
 widget.roundCircleButton(Icons.navigate_next, false, _loginValidate);
*/

extension WidgetExtensions on Widget {
  inputField(TextEditingController textEditingController,
          {ValueChanged<String> onChanged,
          int maxLength,
          TextInputType keyboardType,
          String hintText,
          String labelText,
          int maxLines = 1,
          bool obscureText = false,
          InkWell inkWell,
          FormFieldValidator<String> validation}) =>
      TextFormField(
          controller: textEditingController,
          cursorColor: appBarTitleColor,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLength: maxLength,
          style: TextStyle(fontFamily: regularFont),
          maxLines: maxLines,
          onChanged: onChanged,
          decoration: InputDecoration(
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.black, width: 1.0)),
              errorBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.0)),
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.black, width: 1.0)),
              errorStyle: TextStyle(fontFamily: regularFont, color: Colors.red),
              hintStyle:
                  TextStyle(fontFamily: regularFont, color: Colors.black),
              labelStyle:
                  TextStyle(fontFamily: regularFont, color: Colors.black),
              suffixStyle:
                  TextStyle(fontFamily: regularFont, color: Colors.black),
              prefixStyle:
                  TextStyle(fontFamily: regularFont, color: Colors.black),
              counterStyle:
                  TextStyle(fontFamily: regularFont, color: Colors.black),
              helperStyle:
                  TextStyle(fontFamily: regularFont, color: Colors.black),
              hintText: hintText,
              counterText: '',
              labelText: labelText,
              suffix: inkWell),
          validator: validation);

  drawerMenu(
          {GestureTapCallback onPressed,
          String name,
          Widget leading,
          Widget trailing}) =>
      ListTile(
          title: Text(name,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0)),
          leading: leading,
          trailing: trailing,
          onTap: onPressed);

  addSub(
          {GestureTapCallback onPressed,
          IconData iconData,
          Color buttonBgColor,
          Color buttonColor}) =>
      Padding(
          padding: EdgeInsets.all(2),
          child: Container(
              width: 25.0,
              height: 25.0,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: buttonBgColor),
              child: RawMaterialButton(
                  shape: CircleBorder(),
                  onPressed: onPressed,
                  child: Icon(iconData, color: buttonColor, size: 18))));

  cardView(EdgeInsets margin, EdgeInsets padding) => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0, // has the effect of softening the shadow
                spreadRadius: 0.5, // has the effect of extending the shadow
                offset: Offset(
                    0, // horizontal, move right 10
                    0 // vertical, move down 10
                    ))
          ]),
      child: this,
      margin: margin,
      padding: padding);

  size({double widthScale = 0.0, double heightScale = 0.0}) =>
      SizedBox(width: widthScale, height: heightScale);

  marginVisible({EdgeInsets edgeInsets, bool isVisible = true}) => Visibility(
      visible: isVisible,
      child: Container(
          margin: (edgeInsets == null) ? EdgeInsets.all(0) : edgeInsets,
          child: this));

  circleAvatar({double radius, Color color}) =>
      CircleAvatar(radius: radius, backgroundColor: color, child: this);

  socialIcon({Icon icon, backgroundColor: Colors, VoidCallback voidCallback}) =>
      Container(
          width: 40.0,
          height: 40.0,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
          child: RawMaterialButton(
              shape: CircleBorder(),
              onPressed: voidCallback,
              child: IconShadowWidget(icon)));

  roundCircleButton(
          {IconData iconData,
          Color color,
          bool isMini: true,
          VoidCallback voidCallback}) =>
      FloatingActionButton(
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          mini: isMini,
          onPressed: voidCallback,
          child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradientsButton)),
              child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[Icon(iconData, size: 30, color: color)])));

  customFloatForm(
          {IconData icon,
          Color color,
          VoidCallback qrCallback,
          bool isMini = false,
          StateStatus stateStatus}) =>
      FloatingActionButton(
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          mini: isMini,
          onPressed: stateStatus != StateStatus.LOADING ? qrCallback : null,
          child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradientsButton)),
              child: Stack(fit: StackFit.expand, children: <Widget>[
                stateStatus == StateStatus.LOADING
                    ? CircularProgressIndicator(strokeWidth: 1)
                    : Offstage(),
                Icon(icon, size: 30, color: color)
              ])));
}
