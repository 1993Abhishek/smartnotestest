import 'package:flutter/material.dart';
import 'package:smartnotestest/core/enums/view_state.dart';
import 'package:smartnotestest/core/helper/extension_helper.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/core/repository/password_management_repository.dart';
import 'package:smartnotestest/core/viewmodel/_base_model.dart';

class PasswordManagementViewModel extends BaseModel {
  PasswordManagementRepository _repository = PasswordManagementRepository();

  Future<SCRResponseModel> changePassword(
      {@required String oldPassword, @required String newPassword}) async {
    setState(ViewState.Busy);
    SCRResponseModel updateResponse = await _repository.changePassword(
        oldPassword: oldPassword, newPassword: newPassword);
    setState(ViewState.Idle);
    return updateResponse;
  }

  Future<SCRResponseModel> requestForgotPasswordOTP(
      {@required String phone}) async {
    setState(ViewState.Busy);
    SCRResponseModel updateResponse = await _repository.requestForgotPassword(
        phone: phone.generateRawPhoneNumber());
    setState(ViewState.Idle);
    return updateResponse;
  }

  Future<SCRResponseModel> setForgotPassword(
      {@required String phone,
      @required String otp,
      @required String password}) async {
    setState(ViewState.Busy);
    SCRResponseModel updateResponse = await _repository.forgotPasswordSet(
        password: password, phone: phone.generateRawPhoneNumber(), otp: otp);
    setState(ViewState.Idle);
    return updateResponse;
  }
}
