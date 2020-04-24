import 'package:flutter/material.dart';
import 'package:smartnotestest/core/manager/SCR_URLS.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/core/model/app_settings.dart';
import 'package:smartnotestest/core/repository/_remote_repository.dart';
import 'package:smartnotestest/locator.dart';

class LoginRepository {
  RemoteRepository _remoteRepository = locator<RemoteRepository>();
  AppSettings _appSettings = locator<AppSettings>();

  Future<SCRResponseModel> authenticatingUser({
    @required String mobileNo,
    @required String password,
  }) async {
    /*As per backend (Souvik Bose) we need to send device push key via the parameter device_id*/
    Map<String, dynamic> params = {
      "device_type": _appSettings.deviceType,
      "device_id": _appSettings.devicePushKey,
      "phone": mobileNo,
      "password": password,
    };
    return await _remoteRepository.postRequest(
      apiEndPoint: SCRAppURLS.log_in,
      params: params,
      dataResponseKey: 'user_data',
      dataResponseKeyExtra: 'required_verification_flag',
    );
  }
}
