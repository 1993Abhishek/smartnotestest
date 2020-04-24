import 'package:flutter/cupertino.dart';
import 'package:smartnotestest/core/manager/SCR_URLS.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/core/model/app_settings.dart';
import 'package:smartnotestest/core/model/user_login_model.dart';

import '../../locator.dart';
import '_remote_repository.dart';

class PasswordManagementRepository {
  RemoteRepository _remoteRepository = locator<RemoteRepository>();
  AppSettings _appSettings = locator<AppSettings>();
  UserLoginModel _userLoginModel = locator<UserLoginModel>();

  Future<SCRResponseModel> changePassword(
      {@required String oldPassword, @required String newPassword}) async {
    Map<String, dynamic> params = {
      "user_id": _userLoginModel.userId,
      "old_password": oldPassword,
      "password": newPassword,
    };
    return await _remoteRepository.postRequest(
        apiEndPoint: SCRAppURLS.changePassword, params: params);
  }

  Future<SCRResponseModel> resendOTP(
      {@required String phone, @required String otpType}) async {
//    print("********************************Phone No=>>>>> $phone*******************************");
    Map<String, dynamic> params = {
      "phone": phone,
      "otp_type": otpType,
    };
    return await _remoteRepository.postRequest(
        apiEndPoint: SCRAppURLS.resendOTP, params: params);
  }

  Future<SCRResponseModel> requestForgotPassword(
      {@required String phone}) async {
    Map<String, dynamic> params = {
      "phone": phone,
    };
    return await _remoteRepository.postRequest(
        apiEndPoint: SCRAppURLS.requestForgotPassword, params: params);
  }

  Future<SCRResponseModel> forgotPasswordSet(
      {@required String phone,
      @required String otp,
      @required String password}) async {
    Map<String, dynamic> params = {
      "phone": phone,
      "OTP": otp,
      "password": password,
    };
    return await _remoteRepository.postRequest(
        apiEndPoint: SCRAppURLS.processForgotPassword, params: params);
  }
}
