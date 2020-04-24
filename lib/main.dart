import 'dart:io';
import 'dart:math';

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smartnotestest/core/manager/shared_preference_service.dart';
import 'package:smartnotestest/core/model/app_settings.dart';
import 'package:smartnotestest/router.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';

import 'locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(SelfCareRevolution());
  });
}

class SelfCareRevolution extends StatefulWidget {
  @override
  _SelfCareRevolutionState createState() => _SelfCareRevolutionState();
}

class _SelfCareRevolutionState extends State<SelfCareRevolution> {
  AppSettings _appSettings = locator<AppSettings>();
  final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>(debugLabel: "navigator");

//  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
//  Map<String, dynamic> _notificationMessage;
//  Map<String, dynamic> _notificationPrevious;

//  Future onSelectNotification(String notificationID) async {
//    debugPrint("---onSelectNotification---$notificationID");
//    await navigatorKey.currentState.pushNamed(Router.ROUTE_NOTIFICATION_DETAILS,
//        arguments: notificationID);
//    navigatorKey.currentState.pushReplacementNamed(Router.ROUTE_HOME);
//  }

//  Future _showNotificationWithDefaultSound(String title, String message,
//      String payload) async {
//    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//        "scr_local_notification",
//        'scr_notification',
//        'Self Care Local Notification',
//        icon: "",
//        color: AppColor.hexToColor("#673ab7"),
//        enableLights: true,
//        enableVibration: true,
//        category: "social",
//        playSound: true,
////        style: AndroidNotificationStyle.BigText,
//        importance: Importance.Max,
//        priority: Priority.High);
//
//    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
//    var platformChannelSpecifics = new NotificationDetails(
//        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//
//    var random = new Random();
//    var notificationID = random.nextInt(100);
//
//    await _flutterLocalNotificationsPlugin.show(
//      notificationID,
//      title,
//      message,
//      platformChannelSpecifics,
//      payload: payload,
//    );
//  }
//
//  bool _isAndroidNotificationsAreSame() {
//    debugPrint("----isNotificationsAreSame-------");
//    debugPrint("_notificationMessage==>$_notificationMessage");
//    debugPrint("_notificationPrevious==>$_notificationPrevious");
//    if (_notificationMessage == null || _notificationPrevious == null)
//      return false;
//    else {
//      String notificationTypeCurrentID =
//      _notificationMessage["data"]['notification_id'];
//      String notificationTypePrevious =
//      _notificationPrevious["data"]['notification_id'];
//      if (notificationTypeCurrentID == notificationTypePrevious) {
//        return true;
//      }
//    }
//    return false;
//  }
//
//  _onBackgroundNotificationClick(Map<String, dynamic> message) {
//    String notificationID = "";
//    if (Platform.isIOS) {
//      notificationID = message['notification_id'] != null
//          ? message['notification_id'].toString()
//          : "";
//    } else {
//      notificationID = message["data"]['notification_id'] != null
//          ? message["data"]['notification_id'].toString()
//          : "";
//    }
//    //WidgetHelper.showToastMessage("notificationID==>$notificationID");
//    SharedPreference.saveStringPreference(
//        SharedPreference.notificationID, notificationID);
//  }
//
//  _getToken() {
//    _firebaseMessaging.getToken().then((deviceToken) {
//      _appSettings.devicePushKey = deviceToken;
//      debugPrint("Device token is:  ${_appSettings.devicePushKey}");
//    });
//  }
//
//  _configureFirebaseListeners() {
//    _firebaseMessaging.configure(
//      onMessage: (Map<String, dynamic> message) async {
//        print("On Message:>   ${message}");
//        _notificationMessage = message;
//
//        String title = "";
//        String description = "";
//        String notificationID = "";
//        if (Platform.isIOS) {
//          title = message["notification"]['title'];
//          description = message["notification"]['body'];
//          notificationID = message['notification_id'];
//          //need to show ios dialog stuff
//        } else {
//          title = message["notification"]['title'];
//          description = message["notification"]['body'];
//          notificationID = message['data']['notification_id'];
//          bool isSameNotification = _isAndroidNotificationsAreSame();
//          debugPrint("isSameNotification====>$isSameNotification");
//          if (!isSameNotification) {
//            _showNotificationWithDefaultSound(
//                title, description, notificationID);
//            _notificationPrevious = _notificationMessage;
//          }
//        }
//      },
//      onLaunch: (Map<String, dynamic> message) async {
//        print("On Launch:>   $message");
//        _onBackgroundNotificationClick(message);
//      },
//      onResume: (Map<String, dynamic> message) async {
//        print("On Resume:>   ${message}");
//        String notificationID = "";
//        if (Platform.isIOS) {
//          notificationID = message['notification_id'];
//        } else {
//          notificationID = message['data']['notification_id'];
//        }
//        if (notificationID.isNotEmpty)
//          onSelectNotification(notificationID);
//      },
//    );
//  }
//
//  _configureLocalNotification() {
//    var initializationSettingsAndroid =
//    AndroidInitializationSettings('@drawable/ic_notification');
//    var initializationSettingsIOS = new IOSInitializationSettings(
//        defaultPresentSound: true,
//        defaultPresentBadge: true,
//        defaultPresentAlert: true);
//    var initializationSettings = new InitializationSettings(
//        initializationSettingsAndroid, initializationSettingsIOS);
//    _flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
//        onSelectNotification: onSelectNotification);
//  }
//
//  @override
//  void initState() {
//    _configureLocalNotification();
//    _configureFirebaseListeners();
//    _getToken();
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Self Care Revolution',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColor.colorPrimary,
          accentColor: Colors.black,
          cursorColor: Colors.black,
          fontFamily: "Viga"),
      initialRoute: Router.ROUTE_INITIAL,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
