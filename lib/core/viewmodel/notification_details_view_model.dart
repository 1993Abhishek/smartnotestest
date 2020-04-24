import 'package:flutter/material.dart';
import 'package:smartnotestest/core/enums/view_state.dart';
import 'package:smartnotestest/core/manager/api_data_manager.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/core/model/notification_itemModel.dart';
import 'package:smartnotestest/core/repository/notification_repository.dart';
import 'package:smartnotestest/core/viewmodel/_base_model.dart';

class NotificationDetailsViewModel extends BaseModel {
  NotificationRepository _repository = NotificationRepository();
  SCRResponseModel notificationDetailsResponse;
  NotificationItemModel notificationItem;
  String imageBaseUrl;

  Future fetchNotificationDetails(String notificationID) async {
    List<NotificationItemModel> newNotificationList = [];
    setState(ViewState.Busy);
    notificationDetailsResponse = await _repository.getNotificationDetails(
        notificationID: notificationID);
    if (notificationDetailsResponse.result) {
      imageBaseUrl = notificationDetailsResponse.dataResponseExtra.toString();
      debugPrint("imageBaseUrl====>$imageBaseUrl");
      newNotificationList = APIDataManager.generateNotificationList(
          notificationList: notificationDetailsResponse.dataResponse);
      if (newNotificationList.length > 0)
        notificationItem = newNotificationList[0];
      debugPrint("full Url ====>${imageBaseUrl + "/" +
          notificationItem.notificationImage}");
    }

    setState(ViewState.Idle);
  }
}
