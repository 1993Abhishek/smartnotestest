import 'package:smartnotestest/core/enums/view_state.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/core/model/profile_item_model.dart';
import 'package:smartnotestest/core/repository/profile_repository.dart';
import 'package:smartnotestest/core/viewmodel/_base_model.dart';

class SettingViewModel extends BaseModel {
  ProfileRepository _repository = ProfileRepository();
  SCRResponseModel profileResponse;

  ProfileItemModel profileItemModel = ProfileItemModel();
  bool isFetchingProfile = false;
  bool isPushNotificationOn = false;

  Future fetchProfileData() async {
    isFetchingProfile = true;
    setState(ViewState.Busy);
    profileResponse = await _repository.fetchProfileData();
    if (profileResponse.result) {
      profileItemModel =
          ProfileItemModel.fromJson(profileResponse.dataResponse);
      isPushNotificationOn = profileItemModel.notificationFlag == 1;
    }
    isFetchingProfile = false;
    setState(ViewState.Idle);
  }

  Future<SCRResponseModel> changeNotificationFlag() async {
    setState(ViewState.Busy);
    SCRResponseModel updateResponse = await _repository.changeNotificationFlag(
        notificationFlag: isPushNotificationOn ? "0" : "1");
    setState(ViewState.Idle);
    return updateResponse;
  }
}
