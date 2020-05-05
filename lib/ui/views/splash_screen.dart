import 'dart:async';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartnotestest/core/model/app_settings.dart';
import 'package:smartnotestest/locator.dart';
import 'package:smartnotestest/router.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/size_config.dart';

class SplashScreen extends StatelessWidget {

  AppSettings _appSettings = locator<AppSettings>();

  String _getDeviceType() {
    ///Device Type 1=iOS 2=Android
    if (Platform.isIOS) {
      return "1";
    }
    return "2";
  }
  Future<String> _getId(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  _performLogin(BuildContext context)
  {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Router.ROUTE_LOGIN);
    });
  }

  @override
  Widget build(BuildContext context) {
    _performLogin(context);
    SizeConfig().init(context);
//    _appSettings.deviceType = _getDeviceType();
//    _appSettings.deviceUniqueKey = await _getId(context);
    // TODO: implement build
    return Scaffold(
        backgroundColor: AppColor.colorSplashScreen,
        body: Stack(
          fit: StackFit.loose,
          alignment: Alignment.center,
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/splash.png",
                  ),
                ),
              ),
            ),
//            Container(
//              padding: EdgeInsets.all(AppDimen.V_DIMEN_30),
//              child: Align(
//                alignment: Alignment.bottomCenter,
//                child: CircularProgressIndicator(
//                  valueColor:
//                  AlwaysStoppedAnimation<Color>(AppColor.colorPrimary),
//                ),
//              ),
//            )
          ],
        ));
  }
}
