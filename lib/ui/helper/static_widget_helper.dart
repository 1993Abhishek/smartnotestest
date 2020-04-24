//import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotestest/core/manager/static_data_manager.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/ui/dialogs/action_alert_dialog.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/phone_number_formatter.dart';

import 'app_dimen.dart';

class WidgetHelper {
  static List<TextInputFormatter> phoneNumberFormatter = [
    LengthLimitingTextInputFormatter(13),
    PhoneNumberTextInputFormatter(),
  ];

  static String removeUSAPhoneFormat(String phoneNumber) {
    String rawPhoneNumber = phoneNumber
        .replaceAll("+1", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll(" ", "")
        .replaceAll("-", "");
    debugPrint("rawPhoneNumber===>$rawPhoneNumber");
    return rawPhoneNumber;
  }

  static String generatePhoneFormat(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return "(" +
          phoneNumber.substring(0, 3) +
          ") " +
          phoneNumber.substring(3, 6) +
          "-" +
          phoneNumber.substring(6, 10);
    }
    return phoneNumber;
  }

  static Future<DateTime> openDatePicker(BuildContext context,
      {DateTime initialDate, DateTime firstDate, DateTime lastDate}) async {
    DateTime current = DateTime.now();
    final DateTime pickedDateTime = await showDatePicker(
        context: context,
        initialDate: initialDate != null ? initialDate : DateTime.now(),
        firstDate:
            firstDate != null ? firstDate : DateTime(current.year - 100, 1),
        lastDate:
            lastDate != null ? lastDate : DateTime(current.year + 100, 1));
    return pickedDateTime;
  }

  static Future<T> showDialog<T>(
      {@required BuildContext context, @required Widget dialogChild}) {
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutSine.transform(a1.value) - 1.0;

          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: dialogChild,
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 700),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }

//   static Flushbar showNoInternetSnackBar({@required BuildContext context}) {
//    return Flushbar(
//      title: "Connection Failed",
//      message: "No Internet. Check your internet and try again.",
//      leftBarIndicatorColor: Colors.grey,
//      shouldIconPulse: true,
//      icon: Icon(
//        Icons.perm_scan_wifi,
//        color: Colors.grey,
//      ),
//      duration: Duration(seconds: 4),
//    )..show(context);
//  }
//
//   static Flushbar showSnackBar(
//      {@required BuildContext context, @required String message}) {
//    return Flushbar(
//      message: message,
//      leftBarIndicatorColor: Colors.grey,
//      shouldIconPulse: true,
//      icon: Icon(
//        Icons.info_outline,
//        color: Colors.grey,
//      ),
//      duration: Duration(seconds: 3),
//    )..show(context);
//  }

  static showToastMessage(String message, {Color backgroundColor}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor:
            backgroundColor != null ? backgroundColor : Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Future showInfoAlertDialog(
      {BuildContext context,
      Widget headerWidget,
      String title,
      String content,
      Widget contentWidget,
      bool isActionAvailable = false,
      bool dismissible = true,
      List<Widget> actionChild}) {
    return showDialog(
        context: context,
        dialogChild: AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.all(0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              dismissible
                  ? Container(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Padding(
                          padding: EdgeInsets.all(AppDimen.H_DIMEN_10),
                          child: Icon(
                            Icons.clear,
                            color: Colors.black45,
                            size: AppDimen.ICON_SIZE_22,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: AppDimen.H_DIMEN_35,
                    ),
              headerWidget != null ? headerWidget : Container(),
              Padding(
                padding: EdgeInsets.only(
                    left: AppDimen.H_DIMEN_30,
                    right: AppDimen.H_DIMEN_30,
                    bottom: AppDimen.H_DIMEN_20),
                child: Column(
                  children: <Widget>[
                    title.isNotEmpty
                        ? Padding(
                            padding: EdgeInsets.all(AppDimen.H_DIMEN_5),
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: AppDimen.TEXT_SIZE_16,
                                  color: AppColor.colorPrimary,
                                  fontWeight: FontWeight.w700,
                                  height: 1.6),
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(top: AppDimen.H_DIMEN_10),
                          ),
                    contentWidget != null
                        ? contentWidget
                        : Text(
                            content,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: AppDimen.TEXT_SIZE_16,
                                color: Colors.black,
                                height: 1.2),
                          ),
                    isActionAvailable
                        ? Padding(
                            padding: EdgeInsets.only(top: AppDimen.H_DIMEN_15),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: actionChild,
                            ),
                          )
                        : Container()
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
              ),
            ],
          ),
        ));
  }

  static void showResponseErrorDialog(
      {@required BuildContext context,
      @required String description,
      String title,
      IconData errorIcon,
      Function onActionClick}) {
    WidgetHelper.showDialog(
        context: context,
        dialogChild: ActionAlertDialog(
          title: title != null ? title : "",
          backgroundColor: AppColor.colorBackgroundLightRed,
          message: description,
          isMultiAction: false,
          topIcon: errorIcon != null ? errorIcon : Icons.error,
          actionColor: Colors.red,
          actionText: "Try again",
          topIconColor: Colors.red,
          onActionClick: () {
            if (onActionClick != null)
              onActionClick();
            else
              Navigator.pop(context);
          },
        ));
  }

  static void showResponseSuccessDialog(
      {@required BuildContext context,
      @required String description,
      String title,
      IconData successIcon,
      Function onActionClick}) {
    WidgetHelper.showDialog(
        context: context,
        dialogChild: ActionAlertDialog(
          title: title != null ? title : "Success!",
          backgroundColor: AppColor.colorBackgroundLightGreen,
          message: description,
          isMultiAction: false,
          topIcon: successIcon != null ? successIcon : Icons.check_circle,
          actionColor: Colors.green,
          actionText: "Next",
          topIconColor: Colors.green,
          onActionClick: () {
            if (onActionClick != null)
              onActionClick();
            else
              Navigator.pop(context);
          },
        ));
  }

  static processResponseData({@required BuildContext context,
    @required SCRResponseModel response,
    Function onSuccess,
    Function onFailure,
    String errorTitle}) {
    if (response.responseStatus == StaticDataManager.statusCodeNoInternet) {
      showToastMessage("No Internet Connection!!");
    } else if (response.result) {
      if (onSuccess != null) onSuccess();
    } else {
      if (onFailure != null)
        onFailure();
      else
        showResponseErrorDialog(
          context: context,
          description: response.responseMessage,
          title: errorTitle,
        );
    }
  }

  static String generateNameLetter(
      {@required String firstName, @required String lastName}) {
    if (firstName.isNotEmpty && lastName.isNotEmpty) {
      return firstName[0] + lastName[0];
    } else {
      return "";
    }
  }
}
