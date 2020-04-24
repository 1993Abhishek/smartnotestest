import 'package:flutter/material.dart';
import 'package:smartnotestest/core/model/left_menu_item.dart';

class StaticDataManager {
  static const int statusCodeOk = 200;
  static const int statusCodeFalse = 401;
  static const int statusCodeFailed = 403;
  static const int statusCodeRequestNotFound = 404;
  static const int statusCodeInternalServerError = 500;
  static const int statusCodeUnknownError = 900;
  static const int statusCodeNoInternet = 800;

  static const int LEFT_MENU_CHANGE_PASSWORD = 1;
  static const int LEFT_MENU_NOTIFICATION = 2;
  static const int LEFT_MENU_SETTING = 3;
  static const int LEFT_MENU_LOG_OUT = 4;
  static const int LEFT_MENU_ABOUT = 5;
  static const int LEFT_MENU_WELCOME = 6;

  static List<LeftMenuItem> getLeftMenuItems() {
    List<LeftMenuItem> _leftMenuItem = new List();

    _leftMenuItem.add(
      LeftMenuItem(
          menuID: LEFT_MENU_WELCOME,
          menuName: "Welcome",
          icon: Icons.tag_faces),
    );

    _leftMenuItem.add(
      LeftMenuItem(
        menuID: LEFT_MENU_NOTIFICATION,
        menuName: "View Reminders",
        icon: Icons.notifications,
      ),
    );

    _leftMenuItem.add(
      LeftMenuItem(
        menuID: LEFT_MENU_ABOUT,
        menuName: "About Us",
        icon: Icons.favorite,
      ),
    );

    _leftMenuItem.add(
      LeftMenuItem(
          menuID: LEFT_MENU_CHANGE_PASSWORD,
          menuName: "Change Password",
          icon: Icons.lock),
    );

    _leftMenuItem.add(
      LeftMenuItem(
        menuID: LEFT_MENU_SETTING,
        menuName: "Settings",
        icon: Icons.settings,
      ),
    );


    _leftMenuItem.add(
      LeftMenuItem(
        menuID: LEFT_MENU_LOG_OUT,
        menuName: "Logout",
        icon: Icons.exit_to_app,
      ),
    );
    return _leftMenuItem;
  }
}
