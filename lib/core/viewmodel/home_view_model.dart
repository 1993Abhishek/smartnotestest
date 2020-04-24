import 'package:smartnotestest/core/enums/view_state.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/core/repository/profile_repository.dart';
import 'package:smartnotestest/core/viewmodel/_base_model.dart';

class HomeViewModel extends BaseModel {
  ProfileRepository _repository = ProfileRepository();

  Future<SCRResponseModel> logOut() async {
    setState(ViewState.Busy);
    SCRResponseModel response = await _repository.logOut();
    setState(ViewState.Idle);
    return response;
  }
}
