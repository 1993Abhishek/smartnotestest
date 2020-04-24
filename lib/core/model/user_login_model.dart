/*class UserLoginModel {
  String _userLoginID;
  String _userLoginPassword;
  String _name;
  String _phone;
  int _loginStatus;
  int _isVerified;
  String _profileImage;
  int _isBlocked;
  String _accessToken;
  String _mobileNumberError = "";
  String _passwordError = "";

  void clearAllError() {
    _mobileNumberError = "";
    _passwordError = "";
  }

  UserLoginModel(
      {int responseStatus,
        String responseMessage,
        int userRoleId,
        String firstName,
        String lastName,
        String name,
        String phone,
        int loginStatus,
        int isVerified,
        int isBlocked,
        String accessToken}) {
    this._name = name;
    this._phone = phone;
    this._loginStatus = loginStatus;
    this._isVerified = isVerified;
    this._profileImage = profileImage;
    this._isBlocked = isBlocked;
    this._accessToken = accessToken;
  }
  String get mobileNumberError => _mobileNumberError;

  set mobileNumberError(String value) {
    _mobileNumberError = value;
  }

  String get passwordError => _passwordError;

  set passwordError(String value) {
    _passwordError = value;
  }

  String get userLoginID => _userLoginID;

  set userLoginID(String value) {
    _userLoginID = value;
  }


  String get name => _name;

  set name(String name) => _name = name;

  String get phone => _phone;

  set phone(String phone) => _phone = phone;

  int get loginStatus => _loginStatus;

  set loginStatus(int loginStatus) => _loginStatus = loginStatus;

  int get isVerified => _isVerified;

  set isVerified(int isVerified) => _isVerified = isVerified;

  String get profileImage => _profileImage;

  set profileImage(String profileImage) => _profileImage = profileImage;

  int get isBlocked => _isBlocked;

  set isBlocked(int isBlocked) => _isBlocked = isBlocked;

  String get accessToken => _accessToken;

  set accessToken(String accessToken) => _accessToken = accessToken;

  String get userLoginPassword => _userLoginPassword;

  set userLoginPassword(String value) {
    _userLoginPassword = value;
  }

  setUserModelData(UserLoginModel model) {
    _name = model.name;
    _phone = model.phone;
    _loginStatus = model.loginStatus;
    _isVerified = model.isVerified;
    _profileImage = model.profileImage;
  }

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _phone = json['phone'];
    _loginStatus = json['login_status'];
    _isVerified = json['is_verified'];
    _profileImage = json['profile_image'];
    _accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['phone'] = this._phone;
    data['login_status'] = this._loginStatus;
    data['is_verified'] = this._isVerified;
    data['profile_image'] = this._profileImage;
    data['is_blocked'] = this._isBlocked;
    data['access_token'] = this._accessToken;
    return data;
  }

  @override
  String toString() {
    return 'UserLoginModel{_userLoginID: $_userLoginID, _userLoginPassword: $_userLoginPassword, _name: $_name, _phone: $_phone, _loginStatus: $_loginStatus, _isVerified: $_isVerified, _profileImage: $_profileImage, _isBlocked: $_isBlocked, _accessToken: $_accessToken,}';
  }
}*/

class UserLoginModel {
  String userLoginID;
  String userLoginPassword;
  String mobileNumberError = "";
  String passwordError = "";

  int userId;
  String firstName;
  String lastName;
  String phone;
  int status;
  int isVerified;
  String createdAt;
  String updatedAt;

  UserLoginModel({this.userId,
    this.firstName,
    this.lastName,
    this.phone,
    this.status,
    this.isVerified,
    this.createdAt,
    this.updatedAt});

  setUserModelData(UserLoginModel model) {
    userId = model.userId;
    firstName = model.firstName;
    lastName = model.lastName;
    phone = model.phone;
    status = model.status;
    isVerified = model.isVerified;
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
  }

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    status = json['status'];
    isVerified = json['is_verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['is_verified'] = this.isVerified;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  @override
  String toString() {
    return 'UserLoginModel{userLoginID: $userLoginID, userLoginPassword: $userLoginPassword, userId: $userId, firstName: $firstName, lastName: $lastName, phone: $phone, status: $status, isVerified: $isVerified, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
