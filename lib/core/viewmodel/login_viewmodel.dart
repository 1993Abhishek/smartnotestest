import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:smartnotestest/core/enums/view_state.dart';
import 'package:smartnotestest/core/helper/extension_helper.dart';
import 'package:smartnotestest/core/manager/api_data_manager.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/core/model/user_login_model.dart';
import 'package:smartnotestest/core/repository/login_repository.dart';
import 'package:smartnotestest/core/repository/password_management_repository.dart';
import 'package:smartnotestest/core/viewmodel/_base_model.dart';
import 'package:smartnotestest/locator.dart';

class LoginViewModel extends BaseModel {
  LoginRepository _repository = LoginRepository();
  PasswordManagementRepository _passwordRepository = PasswordManagementRepository();
  UserLoginModel loginModel = locator<UserLoginModel>();
  bool isCheckingOn = false;
  bool isRememberMe = false;
  bool isValidPhoneNumber = false;
  bool isShowingPassword = false;

  void checkForValidPhoneNumber() {
    if (loginModel.userLoginID.isEmpty ||
        !loginModel.userLoginID.generateRawPhoneNumber().isValidPhoneNumber()) {
      isValidPhoneNumber = false;
    } else {
      isValidPhoneNumber = true;
    }
    notifyListeners();
  }

  bool checkValidation() {
    bool isValidationSuccess = false;
    loginModel.mobileNumberError = "";
    loginModel.passwordError = "";
    isCheckingOn = true;
    if (loginModel.userLoginID.isEmpty) {
      loginModel.mobileNumberError = "Please enter your phone number.";
    } else if (!loginModel.userLoginID
        .generateRawPhoneNumber()
        .isValidPhoneNumber()) {
      loginModel.mobileNumberError = "Please enter a valid phone number.";
    } else if (loginModel.userLoginPassword.isEmpty) {
      loginModel.passwordError = "Please enter your password.";
    } else {
      isCheckingOn = false;
      isValidationSuccess = true;
    }
    notifyListeners();
    return isValidationSuccess;
  }

  Future<SCRResponseModel> authenticatingUser({
    @required String mobileNo,
    @required String password,
  }) async {
    List<UserLoginModel> newUserList = [];
    setState(ViewState.Busy);
    SCRResponseModel response = await _repository.authenticatingUser(
      mobileNo: "${mobileNo.generateRawPhoneNumber()}",
      password: password,
    );
//    if (response.result)
//      {
//        newUserList= APIDataManager.generateUserDetails(userDetailsList: response.dataResponse);
//      }
    setState(ViewState.Idle);
    return response;
  }

  Future<SCRResponseModel> reSendOTP({@required String phone}) async {
    setState(ViewState.Busy);
    SCRResponseModel responseModel = await _passwordRepository.resendOTP(
        phone: phone, otpType: "OTP");
    setState(ViewState.Idle);
    return responseModel;
  }
}
