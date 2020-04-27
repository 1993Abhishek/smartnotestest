import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartnotestest/ui/helper/route_animation.dart';
import 'package:smartnotestest/ui/views/login_view.dart';
import 'package:smartnotestest/ui/views/my_profile_view.dart';
import 'package:smartnotestest/ui/views/signup.dart';
import 'package:smartnotestest/ui/views/splash_screen.dart';
import 'package:smartnotestest/ui/views/text_editing_view.dart';
//import 'package:selfcarerevolution/ui/helper/route_animation.dart';
//import 'package:selfcarerevolution/ui/views/about_view.dart';
//import 'package:selfcarerevolution/ui/views/chnage_password.dart';
//import 'package:selfcarerevolution/ui/views/forgot_password.dart';
//import 'package:selfcarerevolution/ui/views/forgot_password_send_otp.dart';
//import 'package:selfcarerevolution/ui/views/home_page.dart';
//import 'package:selfcarerevolution/ui/views/login_page.dart';
//import 'package:selfcarerevolution/ui/views/my_profile_page.dart';
//import 'package:selfcarerevolution/ui/views/notification_details_page.dart';
//import 'package:selfcarerevolution/ui/views/notification_list_page.dart';
//import 'package:selfcarerevolution/ui/views/otp_verification_page.dart';
//import 'package:selfcarerevolution/ui/views/registration_page.dart';
//import 'package:selfcarerevolution/ui/views/scr_web_view.dart';
//import 'package:selfcarerevolution/ui/views/setting_page.dart';
//import 'package:selfcarerevolution/ui/views/splash_page.dart';
//import 'package:selfcarerevolution/ui/views/welcome_views.dart';

class Router {
  static const String ROUTE_INITIAL = "/";
  static const String ROUTE_SPLASH = "splash";
  static const String ROUTE_LOGIN = "login";
  static const String ROUTE_REGISTRATION = "registration";
  static const String ROUTE_HOME = "home";
  static const String ROUTE_NOTIFICATION_DETAILS = "notification_details";
  static const String ROUTE_NOTIFICATION_LIST = "notification_list";
  static const String ROUTE_OTP_VERIFICATION = "otp_verification";
  static const String ROUTE_SETTINGS = "settings";
  static const String ROUTE_MY_PROFILE = "my_profile";
  static const String ABOUT = "about";
  static const String ROUTE_FORGOT_PASSWORD_SEND = "forgot_password_otp_send";
  static const String ROUTE_FORGOT_PASSWORD_RESET = "forgot_password_reset";
  static const String ROUTE_CHANGE_PASSWORD = "chnage_password";
  static const String ROUTE_SCR_WEB_VIEW = "scr_web_view";
  static const String ROUTE_WELCOME = "welcome_screen";
  static const String ROUTE_TEXT_EDITING = "text_editing";

  static String ROUTE_CURRENT = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    ROUTE_CURRENT = settings.name;
    Widget currentWidget;

    switch (settings.name) {
      case ROUTE_INITIAL:
        currentWidget = SplashScreen();
        break;
//      case ROUTE_HOME:
//        currentWidget = HomePage();
//        break;
      case ROUTE_LOGIN:
        currentWidget = LogIn();
        break;
      case ROUTE_REGISTRATION:
        currentWidget = Signup();
        break;

      case ROUTE_TEXT_EDITING:
        currentWidget = TextEditing();
        break;

//      case ROUTE_NOTIFICATION_DETAILS:
//        currentWidget =
//            NotificationDetails(notificationID: settings.arguments,);
//        break;
//      case ROUTE_NOTIFICATION_LIST:
//        currentWidget = NotificationListPage();
//        break;
//      case ROUTE_OTP_VERIFICATION:
//        String phoneNumber = settings.arguments as String;
//        currentWidget = OTPVerificationView(
//          phoneNumber: phoneNumber,
//        );
//        break;
//
      case ROUTE_MY_PROFILE:
        currentWidget = MyProfile();
        break;
//
//      case ABOUT:
//        currentWidget = AboutPage();
//        break;
//      case ROUTE_WELCOME:
//        bool fromRegistration= settings.arguments as bool;
//        currentWidget = WelcomePage(isFromRegistration: fromRegistration,);
//        break;
//      case ROUTE_SETTINGS:
//        currentWidget = SettingPage();
//        break;
//      case ROUTE_FORGOT_PASSWORD_SEND:
//        currentWidget = ForgotPasswordSendOTP();
//        break;
//      case ROUTE_FORGOT_PASSWORD_RESET:
//        currentWidget = ForgotPasswordView(phoneNumber: settings.arguments);
//        break;
//      case ROUTE_CHANGE_PASSWORD:
//        currentWidget = ChangePasswordView();
//        break;
//      case ROUTE_SCR_WEB_VIEW:
//        var data = settings.arguments as dynamic;
//        currentWidget = SCRWebView(
//            appBarText: data["app_bar_text"], webApiUrl: data["url"]);
//        break;

      default:
        currentWidget = Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
    return FadeRoute(page: currentWidget, settings: settings);
  }
}
