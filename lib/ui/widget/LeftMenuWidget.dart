import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartnotestest/core/model/left_menu_item.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_spacing.dart';

class LeftMenuWidget extends StatelessWidget {
  final LeftMenuItem leftMenuItem;
  final Function onMenuClick;

  const LeftMenuWidget(
      {Key key, @required this.leftMenuItem, @required this.onMenuClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () => onMenuClick(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              AppSpacing.horizontalSpace(AppDimen.H_DIMEN_50),
              Icon(
                leftMenuItem.icon,
                color: Colors.white,
              ),
              AppSpacing.horizontalSpace(AppDimen.H_DIMEN_30),
              Text(
                leftMenuItem.menuName,
                style: TextStyle(
                  fontSize: AppDimen.TEXT_SIZE_17,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        AppSpacing.verticalSpace(AppDimen.H_DIMEN_35)
      ],
    );
  }
}
