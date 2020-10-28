import 'package:flutter/material.dart';
import 'colors.dart';
import 'font.dart';

var splashTitleStyle = TextStyle(fontSize: 30, color: appBarTitleColor, fontFamily: mediumFont);
var appBarTitleStyle = TextStyle(fontSize: 18, color: appBarTitleColor, fontFamily: mediumFont);
var appBarAddressStyle = TextStyle(fontSize: 12, color: appBarAddressColor, fontFamily: mediumFont);
var countStyle = TextStyle(fontSize: 8, color: countColor, fontFamily: mediumFont);

doNotHaveAccountStyle(Color color) => TextStyle(fontSize: 15.0, color: color, fontFamily: regularFont);
loginLinkStyle(Color color) => TextStyle(fontSize: 15.0, fontFamily: mediumFont, color: color);

var tabSelectStyle = TextStyle(fontSize: 14, fontFamily: mediumFont);
var tabUnSelectStyle = TextStyle(fontSize: 12, fontFamily: mediumFont);

var id = TextStyle(color: Colors.black, fontSize: 12, fontFamily: mediumFont);
var deliveryType = TextStyle(color: Colors.deepOrange, fontSize: 14, fontFamily: mediumFont);
var menuNameStyle =TextStyle(color: Colors.black, fontSize: 14, fontFamily: regularFont);
var orderTypeStyle =TextStyle(color: Colors.grey, fontSize: 15, fontFamily: regularFont);
var menuPriceStyle = TextStyle(color: Colors.grey, fontSize: 12, fontFamily: regularFont);
var dateTime = TextStyle(color: Colors.blueGrey, fontSize: 12, fontFamily: regularFont);
var timeCalculation =  TextStyle(color: Colors.grey, fontSize: 10, fontFamily: regularFont);
var quantitySymbol = TextStyle(color: Colors.grey, fontSize: 14, fontFamily: regularFont);
var quantity = TextStyle(color: Colors.grey, fontSize: 12, fontFamily: regularFont);
var paymentPaidStatus = TextStyle(color: Colors.green, fontSize: 15, fontFamily: mediumFont);
var paymentCollect = TextStyle(color: Colors.black, fontSize: 12, fontFamily: mediumFont);
var totalQuantity = TextStyle(color: Colors.grey, fontSize: 14, fontFamily: mediumFont);
var totalAmount = TextStyle(color: Colors.black, fontSize: 15, fontFamily: mediumFont);
var orderStatusLink = TextStyle(color: Colors.blue, fontSize: 12, fontFamily: mediumFont);
var preparationTime = TextStyle(color: Colors.grey, fontSize: 12, fontFamily: mediumFont);
var preparationTimeMinHour = TextStyle(color: Colors.grey, fontSize: 12, fontFamily: mediumFont);
var preparationTimeUnSelect = TextStyle(color: preparationTimeUnSelectColor, fontSize: 15, fontFamily: regularFont);
var preparationTimeSelect = TextStyle(color: preparationTimeSelectColor, fontSize: 15, fontFamily: mediumFont);

var drawerMenuStyle = TextStyle(color: Colors.black, fontSize: 15, fontFamily: regularFont);
var drawerUserNameStyle = TextStyle(color: appBarTitleColor, fontSize: 16, fontFamily: semiBoldFont);
var drawerEmailStyle = TextStyle(color: Colors.black, fontSize: 12, fontFamily: semiBoldFont);

var orderStatusStyle = TextStyle(color: orderStatusColor,  fontFamily: semiBoldFont, fontSize: 12);

var deliveryPersonNameStyle = TextStyle(color: Colors.black,  fontFamily: mediumFont, fontSize: 14);
var arrivingMinuteStyle = TextStyle(color: Colors.grey,  fontFamily: regularFont, fontSize: 12);
var otpLabelStyle = TextStyle(color: Colors.blueGrey,  fontFamily: regularFont, fontSize: 12);

var pauseMenuTitleStyle = TextStyle(color: pauseMenuTitleColor,  fontFamily: mediumFont, fontSize: 16);
var switchLabelStyle = TextStyle(color: switchLabelColor,  fontFamily: regularFont, fontSize: 14);
var menuAvailableStyle = TextStyle(color: menuAvailableColor,  fontFamily: semiBoldFont, fontSize: 12);

var pastOrderStatus = TextStyle(color: Colors.black, fontSize: 12, fontFamily: regularFont);
var dropDownText = TextStyle(color: Colors.black, fontSize: 14, fontFamily: regularFont);

var kdsViewTitleStyle = TextStyle(color: Colors.black, fontSize: 14, fontFamily: regularFont);
var kdsViewAmountStyle = TextStyle(color: Colors.black, fontSize: 14, fontFamily: mediumFont);

var totalStyle = TextStyle(color: Colors.black54, fontSize: 14, fontFamily: regularFont);
var totalCountStyle = TextStyle(color: Colors.black54, fontSize: 16, fontFamily: mediumFont);

//decoration
var preparationTimeDecoration = BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(3.0)), border: Border.all(color: preparationTimeDecorationColor, width: 1));