import 'package:flutter/cupertino.dart';
import 'package:smartnotestest/core/manager/SCR_URLS.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/core/model/app_settings.dart';
import 'package:smartnotestest/core/model/user_login_model.dart';

import '../../locator.dart';
import '_remote_repository.dart';

class ProfileRepository {
  RemoteRepository _remoteRepository = locator<RemoteRepository>();
  AppSettings _appSettings = locator<AppSettings>();
  UserLoginModel _userLoginModel = locator<UserLoginModel>();

  Future<SCRResponseModel> logOut() async {
    Map<String, dynamic> params = {
      "user_id": _userLoginModel.userId,
    };
    return await _remoteRepository.postRequest(
      apiEndPoint: SCRAppURLS.logout,
      params: params,
    );
  }

  Future<SCRResponseModel> fetchProfileData() async {
    Map<String, dynamic> params = {
      "user_id": _userLoginModel.userId,
    };
    return await _remoteRepository.getRequest(
        apiEndPoint: SCRAppURLS.getProfile,
        params: params,
        dataResponseKey: 'user_data');
  }

  Future<SCRResponseModel> updateProfile(
      {@required String firstName, @required String lastName}) async {
    Map<String, dynamic> params = {
      "user_id": _userLoginModel.userId,
      "first_name": firstName,
      "last_name": lastName,
    };
    return await _remoteRepository.postRequest(
        apiEndPoint: SCRAppURLS.setProfile, params: params);
  }

  Future<SCRResponseModel> changeNotificationFlag(
      {@required String notificationFlag}) async {
    Map<String, dynamic> params = {
      "user_id": _userLoginModel.userId,
      "notification_flag": notificationFlag,
    };
    return await _remoteRepository.postRequest(
        apiEndPoint: SCRAppURLS.setProfile, params: params);
  }
}
