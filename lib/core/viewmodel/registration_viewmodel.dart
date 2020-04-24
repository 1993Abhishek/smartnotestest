import 'package:smartnotestest/core/enums/view_state.dart';
import 'package:smartnotestest/core/helper/extension_helper.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/core/model/registration_model.dart';
import 'package:smartnotestest/core/repository/registration_repository.dart';
import 'package:smartnotestest/core/viewmodel/_base_model.dart';

class RegistrationViewModel extends BaseModel {
  RegistrationRepository _repository = RegistrationRepository();
  RegistrationModel registrationModel = RegistrationModel();
  SCRResponseModel response;
  bool isAddressCheckingOn = false;
  bool isValidPhoneNumber = false;
  bool isValidFirstName = false;
  bool isValidLastName = false;
  bool isShowingPassword = false;

  void checkForValidPhoneNumber() {
    if (registrationModel.mobileNumber.isEmpty ||
        !registrationModel.mobileNumber
            .generateRawPhoneNumber()
            .isValidPhoneNumber()) {
      isValidPhoneNumber = false;
    } else {
      isValidPhoneNumber = true;
    }
    notifyListeners();
  }

  void checkForValidFirstName() {
    if (registrationModel.firstName.isEmpty) {
      isValidFirstName = false;
    } else
      isValidFirstName = true;
    notifyListeners();
  }

  void checkForValidLastName() {
    if (registrationModel.lastName.isEmpty) {
      isValidLastName = false;
    } else
      isValidLastName = true;
    notifyListeners();
  }

  bool validateSignUp() {
    bool isValidationSuccess = false;
    isAddressCheckingOn = true;
    registrationModel.clearAllError();
    if (registrationModel.firstName.isEmpty) {
      registrationModel.firstNameError = "Please enter your first name";
    } else if (registrationModel.lastName.isEmpty) {
      registrationModel.lastNameError = "Please enter your last name";
    } else if (registrationModel.mobileNumber.isEmpty) {
      registrationModel.mobileNumberError = "Please enter your phone number";
    } else if (registrationModel.password.isEmpty) {
      registrationModel.passwordError = "Please enter a valid password";
    } else {
      isAddressCheckingOn = false;
      isValidationSuccess = true;
    }

    notifyListeners();
    return isValidationSuccess;
  }

  Future<SCRResponseModel> registerUser() async {
    setState(ViewState.Busy);
    response = await _repository.registerUser(
      firstName: registrationModel.firstName,
      lastName: registrationModel.lastName,
      phoneNumber: registrationModel.mobileNumber.generateRawPhoneNumber(),
      password: registrationModel.password,
    );
    setState(ViewState.Idle);
    return response;
  }
}
