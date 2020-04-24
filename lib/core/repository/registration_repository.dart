import 'package:flutter/cupertino.dart';
import 'package:smartnotestest/core/helper/extension_helper.dart';
import 'package:smartnotestest/core/manager/SCR_URLS.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/core/model/app_settings.dart';
import 'package:smartnotestest/core/repository/_remote_repository.dart';
import 'package:smartnotestest/locator.dart';

class RegistrationRepository {
  RemoteRepository _remoteRepository = locator<RemoteRepository>();
  AppSettings _appSettings = locator<AppSettings>();

  Future<SCRResponseModel> registerUser({
    @required String firstName,
    @required String lastName,
    @required String phoneNumber,
    @required String password,
  }) async {
    Map<String, dynamic> params = {
      "device_type": _appSettings.deviceType,
      "device_id": _appSettings.deviceUniqueKey,
      "first_name": firstName,
      "last_name": lastName,
      "phone": phoneNumber.generateRawPhoneNumber(),
      "password": password,
    };
    return await _remoteRepository.postRequest(
        apiEndPoint: SCRAppURLS.registration,
        params: params,
        dataResponseKey: 'OTP');
  }
}
