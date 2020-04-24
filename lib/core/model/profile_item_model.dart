class ProfileItemModel {
  int userId;
  String firstName;
  String lastName;
  String phone;
  int oTP;
  String password;
  int deviceType;
  int notificationFlag;
  String deviceId;
  int status;
  int isVerified;
  String createdAt;
  String updatedAt;

  ProfileItemModel(
      {this.userId,
      this.firstName,
      this.lastName,
      this.phone,
      this.oTP,
      this.password,
      this.deviceType,
      this.notificationFlag,
      this.deviceId,
      this.status,
      this.isVerified,
      this.createdAt,
      this.updatedAt}) {
    firstName = "";
    lastName = "";
  }

  ProfileItemModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    oTP = json['OTP'];
    password = json['password'];
    deviceType = json['device_type'];
    notificationFlag = json['notification_flag'];
    deviceId = json['device_id'];
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
    data['OTP'] = this.oTP;
    data['password'] = this.password;
    data['device_type'] = this.deviceType;
    data['notification_flag'] = this.notificationFlag;
    data['device_id'] = this.deviceId;
    data['status'] = this.status;
    data['is_verified'] = this.isVerified;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
