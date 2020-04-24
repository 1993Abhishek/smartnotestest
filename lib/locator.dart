import 'package:get_it/get_it.dart';
import 'package:smartnotestest/core/model/app_settings.dart';
import 'package:smartnotestest/core/model/user_login_model.dart';
import 'package:smartnotestest/core/repository/_remote_repository.dart';
import 'package:smartnotestest/core/viewmodel/login_viewmodel.dart';
import 'package:smartnotestest/core/viewmodel/notification_viewmodel.dart';
import 'package:smartnotestest/core/viewmodel/otp_verification_viewmodel.dart';
import 'package:smartnotestest/core/viewmodel/registration_viewmodel.dart';
import 'package:smartnotestest/core/viewmodel/splash_view_model.dart';

import 'core/viewmodel/home_view_model.dart';
import 'core/viewmodel/notification_details_view_model.dart';
import 'core/viewmodel/password_management_view_model.dart';
import 'core/viewmodel/profile_view_model.dart';
import 'core/viewmodel/settings_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AppSettings());
  locator.registerLazySingleton(() => RemoteRepository());
  locator.registerLazySingleton(() => UserLoginModel());

  locator.registerFactory(() => SplashViewModel());
  locator.registerFactory(() => RegistrationViewModel());
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => OTPVerificationViewModel());
  locator.registerFactory(() => NotificationViewModel());
  locator.registerFactory(() => NotificationDetailsViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => ProfileViewModel());
  locator.registerFactory(() => SettingViewModel());
  locator.registerFactory(() => PasswordManagementViewModel());
}
