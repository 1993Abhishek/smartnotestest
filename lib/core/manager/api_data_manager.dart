import 'package:flutter/cupertino.dart';
import 'package:smartnotestest/core/model/notification_itemModel.dart';
import 'package:smartnotestest/core/model/user_login_model.dart';

class APIDataManager
{
  static List<NotificationItemModel> generateNotificationList(
      {@required dynamic notificationList}) {
    List<NotificationItemModel> notifyList = List();
    for (int i = 0; i < notificationList.length; i++) {
      notifyList.add(NotificationItemModel.fromJson(notificationList[i]));
    }
    return notifyList;
  }

  static List<UserLoginModel> generateUserDetails(
      {@required dynamic userDetailsList}) {
    List<UserLoginModel> detailsList = List();
    for (int i = 0; i < userDetailsList.length; i++) {
      detailsList.add(UserLoginModel.fromJson(userDetailsList[i]));
    }
    return detailsList;
  }
}