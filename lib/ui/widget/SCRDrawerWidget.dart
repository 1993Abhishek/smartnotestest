import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartnotestest/core/helper/extension_helper.dart';
import 'package:smartnotestest/core/manager/static_data_manager.dart';
import 'package:smartnotestest/core/model/left_menu_item.dart';
import 'package:smartnotestest/core/model/user_login_model.dart';
import 'package:smartnotestest/core/viewmodel/home_view_model.dart';
import 'package:smartnotestest/locator.dart';
import 'package:smartnotestest/router.dart';
import 'package:smartnotestest/ui/dialogs/action_alert_dialog.dart';
import 'package:smartnotestest/ui/dialogs/progress_dialog.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_spacing.dart';
import 'package:smartnotestest/ui/helper/static_widget_helper.dart';
import 'package:smartnotestest/ui/widget/LeftMenuWidget.dart';
import 'package:smartnotestest/ui/widget/scroll_configuration.dart';

class SCRDrawerWidget extends StatelessWidget {
  final HomeViewModel homeModel;
  final BuildContext parentContext;
  final UserLoginModel userLoginModel = locator<UserLoginModel>();
  final List<LeftMenuItem> _leftMenuItems =
      StaticDataManager.getLeftMenuItems();

  SCRDrawerWidget({Key key, this.parentContext, this.homeModel})
      : super(key: key);

  _leftMenuNavigation(BuildContext context, LeftMenuItem leftMenuItem) async {
    bool _fromRegistration = false;
    Navigator.of(context).pop();
    switch (leftMenuItem.menuID) {
      case StaticDataManager.LEFT_MENU_WELCOME:
        Navigator.pushNamed(parentContext, Router.ROUTE_WELCOME,
            arguments: _fromRegistration);
        break;

      case StaticDataManager.LEFT_MENU_ABOUT:
        Navigator.pushNamed(parentContext, Router.ABOUT);
        break;
      case StaticDataManager.LEFT_MENU_CHANGE_PASSWORD:
        Navigator.pushNamed(parentContext, Router.ROUTE_CHANGE_PASSWORD);
        break;
      case StaticDataManager.LEFT_MENU_NOTIFICATION:
        Navigator.pushReplacementNamed(parentContext, Router.ROUTE_HOME);
        break;
      case StaticDataManager.LEFT_MENU_SETTING:
        Navigator.pushNamed(parentContext, Router.ROUTE_SETTINGS);
        break;
      case StaticDataManager.LEFT_MENU_LOG_OUT:
        WidgetHelper.showDialog(
            context: parentContext,
            dialogChild: ActionAlertDialog(
                title: "Log Out",
                message: "Do you want to Log Out ?",
                negativeActionText: "NO",
                isMultiAction: true,
                topIcon: Icons.exit_to_app,
                onNegativeActionClick: () => Navigator.pop(parentContext),
                positiveActionText: "YES",
                onPositiveActionClick: () async {
                  Navigator.pop(parentContext);
                  ProgressDialog progressDialog = ProgressDialog(
                      context: parentContext, dialogMessage: "Logging out..");
                  progressDialog.show();
                  await homeModel.logOut();
                  progressDialog.dismissProgress(parentContext);
                  Navigator.pushReplacementNamed(
                      parentContext, Router.ROUTE_LOGIN);
                }));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.colorPrimary,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              Navigator.of(context).pop();
              Navigator.pushNamed(parentContext, Router.ROUTE_MY_PROFILE);
            },
            child: Container(
              //margin: EdgeInsets.only(top: AppDimen.V_DIMEN_60),
              /* padding: EdgeInsets.only(
                  left: AppDimen.H_DIMEN_20, right: AppDimen.H_DIMEN_20),*/
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   Container(
                      height: AppDimen.V_DIMEN_220,
                      width: double.infinity,
                      padding: EdgeInsets.only(top: AppDimen.V_DIMEN_10,),
                      color: Colors.white,
                      child: Center(
                        child: Image.asset(
                          "assets/splash.png",
                          width: AppDimen.H_DIMEN_250,
                          height: AppDimen.V_DIMEN_200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  AppSpacing.verticalSpace(AppDimen.H_DIMEN_15),
                  Text(
                    userLoginModel.firstName + " " + userLoginModel.lastName,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: AppDimen.TEXT_SIZE_20, color: Colors.white),
                  ),
                  AppSpacing.verticalSpace(AppDimen.H_DIMEN_8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.local_phone,
                        color: Colors.white,
                        size: AppDimen.ICON_SIZE_16,
                      ),
                      AppSpacing.horizontalSpace(AppDimen.H_DIMEN_8),
                      Flexible(
                        child: Text(
                          userLoginModel.phone
                              .formatPhoneNumberWithCountryCode(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: AppDimen.TEXT_SIZE_16,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          AppSpacing.verticalSpace(AppDimen.H_DIMEN_30),
//          RichText(
//            text: TextSpan(children: <TextSpan>[
//              TextSpan(
//                text: "Self Care",
//                style: TextStyle(
//                    color: Colors.white,
//                    fontSize: AppDimen.TEXT_SIZE_26,
//                    fontFamily: 'Viga'),
//              ),
//              TextSpan(
//                text: " Revolution",
//                style: TextStyle(
//                    fontSize: AppDimen.TEXT_SIZE_26,
//                    color: AppColor.colorButton,
//                    fontFamily: 'Viga'),
//              )
//            ]),
//          ),
//          AppSpacing.verticalSpace(AppDimen.H_DIMEN_10),
          Expanded(
            child: AppScrollConfiguration(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return LeftMenuWidget(
                    onMenuClick: () =>
                        _leftMenuNavigation(context, _leftMenuItems[index]),
                    leftMenuItem: _leftMenuItems[index],
                  );
                },
                itemCount: _leftMenuItems.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
