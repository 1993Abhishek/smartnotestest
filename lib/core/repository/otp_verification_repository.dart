import 'package:flutter/material.dart';
import 'package:smartnotestest/core/manager/SCR_URLS.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/core/repository/_remote_repository.dart';
import 'package:smartnotestest/locator.dart';

class OTPVerificationRepository {
  RemoteRepository _remoteRepository = locator<RemoteRepository>();

  Future<SCRResponseModel> verifyOTP(
      {
        @required String phoneNo,
        @required String otpCode}) async {
    Map<String, dynamic> params = {
      "phone": phoneNo,
      "OTP": otpCode
    };
    return await _remoteRepository.postRequest(
      apiEndPoint: SCRAppURLS.otp_verify,
      params: params,
    );
  }

//  Future<NotificationResponseModel> resendOTP(
//      {@required String userName, @required String otpType}) async {
//    Map<String, dynamic> params = {
//      "phone": userName,
//      "OTP": otpCode,
//    };
//    return await _remoteRepository.NotificationPostRequest(
//      apiEndPoint: NotificationAppURLS.otp_verify,
//      params: params,
//    );
//  }

}
