import 'package:flutter/cupertino.dart';
import 'package:smartnotestest/core/enums/view_state.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/core/model/profile_item_model.dart';
import 'package:smartnotestest/core/repository/profile_repository.dart';
import 'package:smartnotestest/core/viewmodel/_base_model.dart';

class ProfileViewModel extends BaseModel {
  ProfileRepository _repository = ProfileRepository();
  SCRResponseModel profileResponse;

  ProfileItemModel profileItemModel = ProfileItemModel();
  bool isFetchingProfile = false;
  bool isEditModeOn = false;

  Future fetchProfileData() async {
    isFetchingProfile = true;
    setState(ViewState.Busy);
    profileResponse = await _repository.fetchProfileData();
    if (profileResponse.result) {
      profileItemModel =
          ProfileItemModel.fromJson(profileResponse.dataResponse);
    }
    isFetchingProfile = false;
    setState(ViewState.Idle);
  }

  Future<SCRResponseModel> updateProfile(
      {@required String firstName, @required String lastName}) async {
    setState(ViewState.Busy);
    SCRResponseModel updateResponse = await _repository.updateProfile(
        firstName: firstName, lastName: lastName);
    setState(ViewState.Idle);
    return updateResponse;
  }
}
