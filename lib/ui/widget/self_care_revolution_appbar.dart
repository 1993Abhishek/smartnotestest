import 'package:flutter/material.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';

class SCRAppBar extends PreferredSize {
  final String appBarTitle;
  final bool centerTitle;
  final List<Widget> actions;
  final Widget leading;
  final double appBarHeight;

  SCRAppBar(
      {@required this.appBarTitle,
      @required this.centerTitle,
      this.actions,
      this.appBarHeight,
      this.leading})
      : super(
          preferredSize: Size.fromHeight(
              appBarHeight != null ? appBarHeight : AppDimen.H_DIMEN_64),
          child: AppBar(
            bottomOpacity: 0.5,
            title: Text(
              appBarTitle,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: AppDimen.TEXT_SIZE_20),
            ),
            titleSpacing: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppDimen.H_DIMEN_35)),
            ),
            centerTitle: centerTitle,
            leading: leading,
            actions: actions,
          ),
        );
}
