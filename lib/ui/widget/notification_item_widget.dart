import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartnotestest/core/helper/extension_helper.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/core/model/notification_itemModel.dart';
import 'package:smartnotestest/core/viewmodel/notification_viewmodel.dart';
import 'package:smartnotestest/router.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_spacing.dart';

class NotificationItemWidget extends StatelessWidget {
  final NotificationItemModel notificationItem;
  final Function onItemClick;
  final Function onNotificationDelete;

  NotificationItemWidget({Key key,
    @required this.notificationItem,
    @required this.onItemClick,
    this.onNotificationDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemClick();
      },
      child: Stack(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimen.H_DIMEN_15),
            ),
            elevation: 2,
            child: Container(
              padding: EdgeInsets.only(
                  top: AppDimen.H_DIMEN_20,
                  left: AppDimen.H_DIMEN_15,
                  right: AppDimen.H_DIMEN_15,
                  bottom: AppDimen.H_DIMEN_30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: AppDimen.ICON_SIZE_35,
                    width: AppDimen.ICON_SIZE_35,
                    decoration: BoxDecoration(
                        color: AppColor.colorNotificationCircle,
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.notifications,
                      color: AppColor.colorNotificationIcon,
                      size: AppDimen.ICON_SIZE_18,
                    ),
                  ),
                  AppSpacing.horizontalSpace(AppDimen.H_DIMEN_20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AppSpacing.verticalSpace(AppDimen.H_DIMEN_5),
                        Text(
                          notificationItem.notificationDateTime
                              .toAppDateTimeFormat(),
                          style: TextStyle(
                              fontSize: AppDimen.TEXT_SIZE_16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54),
                        ),
                        AppSpacing.verticalSpace(AppDimen.H_DIMEN_10),
                        Text(
                          notificationItem.notificationTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: AppDimen.TEXT_SIZE_16,
                            color: AppColor.colorNotificationText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AppSpacing.verticalSpace(AppDimen.H_DIMEN_8),
                        Text(
                          "To view the whole Reminder just click it!",
                          style: TextStyle(
                            fontSize: AppDimen.TEXT_SIZE_11,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.black54,
                  size: AppDimen.ICON_SIZE_22,
                ),
                onPressed: () {
                  if (onNotificationDelete != null) {
                    onNotificationDelete();
                  }
                }),
          )
        ],
      ),
    );
  }
}
