import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:smartnotestest/core/enums/view_state.dart';
import 'package:smartnotestest/core/helper/extension_helper.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/core/model/user_login_model.dart';
import 'package:smartnotestest/core/repository/login_repository.dart';
import 'package:smartnotestest/core/viewmodel/_base_model.dart';
import 'package:smartnotestest/locator.dart';

class SplashViewModel extends BaseModel {
  LoginRepository _repository = LoginRepository();
  UserLoginModel loginModel = locator<UserLoginModel>();

  Future<SCRResponseModel> authenticatingUser({
    @required String mobileNo,
    @required String password,
  }) async {
    setState(ViewState.Busy);
    SCRResponseModel response = await _repository.authenticatingUser(
      mobileNo: mobileNo.generateRawPhoneNumber(),
      password: password,
    );
    setState(ViewState.Idle);
    return response;
  }
}
