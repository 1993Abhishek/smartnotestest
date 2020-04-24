import 'package:smartnotestest/core/model/loading_indicator.dart';

class NotificationItemModel with LoadingIndicator {
  int notificationId;
  String notificationText;
  String notificationTitle;
  String notificationImage;
  String notificationLink;
  int notificationType;
  String notificationDateTime;
  int isSent;
  int isBlocked;
  int isConfirmed;
  String createdAt;
  String updatedAt;

  NotificationItemModel(
      {this.notificationId,
        this.notificationText,
        this.notificationTitle,
        this.notificationImage,
        this.notificationLink,
        this.notificationType,
        this.notificationDateTime,
        this.isSent,
        this.isBlocked,
        this.isConfirmed,
        this.createdAt,
        this.updatedAt});

  NotificationItemModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationText = json['notification_text'];
    notificationTitle= json['notification_title'];
    notificationImage = json['notification_image'];
    notificationLink = json['notification_link'];
    notificationType = json['notification_type'];
    notificationDateTime = json['notification_date_time'];
    isSent = json['is_sent'];
    isBlocked = json['is_blocked'];
    isConfirmed = json['is_confirmed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['notification_text'] = this.notificationText;
    data["notification_title"] = this.notificationTitle;
    data['notification_image'] = this.notificationImage;
    data['notification_link'] = this.notificationLink;
    data['notification_type'] = this.notificationType;
    data['notification_date_time'] = this.notificationDateTime;
    data['is_sent'] = this.isSent;
    data['is_blocked'] = this.isBlocked;
    data['is_confirmed'] = this.isConfirmed;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  @override
  String toString() {
    return 'Notification_model{notificationId: $notificationId, notificationText: $notificationText, notification_title:$notificationTitle, notificationImage: $notificationImage, notificationLink: $notificationLink, notificationType: $notificationType, notificationDateTime: $notificationDateTime, isSent: $isSent, isBlocked: $isBlocked, isConfirmed: $isConfirmed, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

}

//class NotificationItemModel {
//  int notificationId;
//  String notificationTitle;
//  String notificationText;
//  String notificationImage;
//  String notificationLink;
//  int notificationType;
//  String notificationDateTime;
//  int isSent;
//  int isBlocked;
//  int isDeleted;
//  int isConfirmed;
//  String createdAt;
//  String updatedAt;
//  int notificationUserId;
//
//  NotificationItemModel(
//      {this.notificationId,
//        this.notificationTitle,
//        this.notificationText,
//        this.notificationImage,
//        this.notificationLink,
//        this.notificationType,
//        this.notificationDateTime,
//        this.isSent,
//        this.isBlocked,
//        this.isDeleted,
//        this.isConfirmed,
//        this.createdAt,
//        this.updatedAt,
//        this.notificationUserId});
//
//  NotificationItemModel.fromJson(Map<String, dynamic> json) {
//    notificationId = json['notification_id'];
//    notificationTitle = json['notification_title'];
//    notificationText = json['notification_text'];
//    notificationImage = json['notification_image'];
//    notificationLink = json['notification_link'];
//    notificationType = json['notification_type'];
//    notificationDateTime = json['notification_date_time'];
//    isSent = json['is_sent'];
//    isBlocked = json['is_blocked'];
//    isDeleted = json['is_deleted'];
//    isConfirmed = json['is_confirmed'];
//    createdAt = json['created_at'];
//    updatedAt = json['updated_at'];
//    notificationUserId = json['notification_user_id'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['notification_id'] = this.notificationId;
//    data['notification_title'] = this.notificationTitle;
//    data['notification_text'] = this.notificationText;
//    data['notification_image'] = this.notificationImage;
//    data['notification_link'] = this.notificationLink;
//    data['notification_type'] = this.notificationType;
//    data['notification_date_time'] = this.notificationDateTime;
//    data['is_sent'] = this.isSent;
//    data['is_blocked'] = this.isBlocked;
//    data['is_deleted'] = this.isDeleted;
//    data['is_confirmed'] = this.isConfirmed;
//    data['created_at'] = this.createdAt;
//    data['updated_at'] = this.updatedAt;
//    data['notification_user_id'] = this.notificationUserId;
//    return data;
//  }
//
//  @override
//  String toString() {
//    return 'NotificationItemModel{notificationId: $notificationId, notificationTitle: $notificationTitle, notificationText: $notificationText, notificationImage: $notificationImage, notificationLink: $notificationLink, notificationType: $notificationType, notificationDateTime: $notificationDateTime, isSent: $isSent, isBlocked: $isBlocked, isDeleted: $isDeleted, isConfirmed: $isConfirmed, createdAt: $createdAt, updatedAt: $updatedAt, notificationUserId: $notificationUserId}';
//  }
//
//
//}