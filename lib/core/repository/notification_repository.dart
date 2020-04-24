import 'package:flutter/cupertino.dart';
import 'package:smartnotestest/core/manager/SCR_URLS.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/core/model/user_login_model.dart';
import 'package:smartnotestest/core/repository/_remote_repository.dart';
import 'package:smartnotestest/locator.dart';

class NotificationRepository {
  RemoteRepository _remoteRepository = locator<RemoteRepository>();
  UserLoginModel _userLoginModel = locator<UserLoginModel>();

  Future<SCRResponseModel> getNotification({@required int pageNo}) async {
//    print("***************************************************************${_userLoginModel.userId}**********************************************************");
    Map<String, dynamic> params = {
      "page": pageNo.toString(),
      "user_id": _userLoginModel.userId,
    };
    return await _remoteRepository.getRequest(
      apiEndPoint: SCRAppURLS.notifications,
      params: params,
      dataResponseKey: "notification_data",
    );
  }

  Future<SCRResponseModel> getNotificationDetails(
      {@required String notificationID}) async {
    Map<String, dynamic> params = {
      "notification_id": notificationID,
      "user_id": _userLoginModel.userId,
    };
    return await _remoteRepository.getRequest(
        apiEndPoint: SCRAppURLS.notifications,
        params: params,
        dataResponseKey: "notification_data",
        dataResponseKeyExtra: 'notification_image_base_url');
  }

  Future<SCRResponseModel> deleteNotification(
      {@required String notificationID}) async {
    Map<String, dynamic> params = {
      "notification_id": notificationID,
      "user_id": _userLoginModel.userId,
    };
    return await _remoteRepository.postRequest(
      apiEndPoint: SCRAppURLS.deleteNotification,
      params: params,
    );
  }
}
