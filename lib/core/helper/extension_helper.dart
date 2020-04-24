import 'package:flutter/cupertino.dart';

import 'app_helper.dart';

extension StringOperation on String {
  String toAppDateTimeFormat() {
    return AppHelper.getDateFromStringDate("MMM dd, yyyy hh:mm a", this);
  }

  bool isValidEmail() {
    String emailRegEx =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(emailRegEx);
    debugPrint("email id ==>$this");
    return regExp.hasMatch(this);
  }

  String generateRawPhoneNumber() {
    return this
        .replaceAll(" ", "")
        .replaceAll("-", "")
        .replaceAll("(", "")
        .replaceAll(")", "");
  }

  String formatPhoneNumber() {
    return this.substring(0, 2) + "-" + this.substring(2, 12);
  }

  String formatPhoneNumberWithCountryCode() {
    return this.substring(0, 2) +
        " (" +
        this.substring(2, 5) +
        ") " +
        this.substring(5, 8) +
        "-" +
        this.substring(8, 12);
  }

  bool isValidPassword() {
    return this.length >= 8;
  }

  bool isValidPhoneNumber() {
    return this.length >= 12;
  }

  bool isPhoneNumber() {
    return this.isNumeric();
  }

  bool isNumeric() {
    if (this == null || this.isEmpty) return false;
    try {
      double.parse(this);
      return true;
    } on Exception {
      return false;
    }
  }

  double toDouble() {
    try {
      var value = double.parse(this);
      return value;
    } on Exception {
      return 0.0;
    }
  }

  int toInt() {
    try {
      var value = int.parse(this);
      return value;
    } on Exception {
      return 0;
    }
  }
}
