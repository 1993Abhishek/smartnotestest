import 'package:flutter/material.dart';
import 'package:smartnotestest/core/enums/view_state.dart';
import 'package:smartnotestest/core/helper/extension_helper.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/core/repository/otp_verification_repository.dart';
import 'package:smartnotestest/core/repository/password_management_repository.dart';
import 'package:smartnotestest/core/viewmodel/_base_model.dart';

class OTPVerificationViewModel extends BaseModel {
  OTPVerificationRepository _repository = OTPVerificationRepository();
  PasswordManagementRepository _passwordRepository = PasswordManagementRepository();
  SCRResponseModel resendOTPResponse;

  Future<SCRResponseModel> verifyOTP(
      {@required String phoneNo, @required String otpCode}) async {
    setState(ViewState.Busy);
    SCRResponseModel responseModel = await _repository.verifyOTP(
        phoneNo: phoneNo.generateRawPhoneNumber(), otpCode: otpCode);
    setState(ViewState.Idle);
    return responseModel;
  }

  Future<SCRResponseModel> reSendOTP({@required String phone}) async {
    setState(ViewState.Busy);
    SCRResponseModel responseModel = await _passwordRepository.resendOTP(
        phone: phone, otpType: "OTP");
    setState(ViewState.Idle);
    return responseModel;
  }


}
