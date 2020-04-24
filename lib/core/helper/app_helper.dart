import 'package:data_connection_checker/data_connection_checker.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppHelper {
//  static Future<String> getFirebaseToken() async {
//    FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//    String token = await _firebaseMessaging.getToken();
//    if (token == null) {
//      token = "";
//    }
//    return token;
//  }

  static String getDateFromDateTime(String dateFormat, DateTime dateTime) {
    var formatter = new DateFormat(dateFormat);
    return formatter.format(dateTime);
  }

  static DateTime getDateTimeFromStringDate(String strDate) {
    if (strDate.isEmpty) return null;
    return DateTime.parse(strDate);
  }

  static String getDateFromStringDate(String dateFormat, String strDate) {
    if (strDate.isEmpty || strDate == null) return strDate;
    debugPrint("strDate===>$strDate");
    var date = DateTime.parse(strDate);
    debugPrint("parse strDate===>$date");
    var formatter = new DateFormat(dateFormat);
    return formatter.format(date);
  }

  static Future<bool> isInternetConnectionAvailable() async {
    return await DataConnectionChecker().hasConnection;
  }

  static String generateNameLetter({String firstName, String lastName}) {
    String nameLetter = "";
    if (firstName.isNotEmpty && lastName.isEmpty) {
      nameLetter = firstName[0];
    } else if (lastName.isNotEmpty && firstName.isEmpty) {
      nameLetter = lastName[0];
    } else {
      nameLetter = firstName[0] + lastName[0];
    }
    return nameLetter.toUpperCase();
  }
}
