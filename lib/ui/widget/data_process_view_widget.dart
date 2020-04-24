import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:smartnotestest/core/manager/static_data_manager.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_strings.dart';
import 'package:smartnotestest/ui/helper/self_care_revolution_text_styles.dart';
import 'package:shimmer/shimmer.dart';

class DataProcessViewWidget extends StatelessWidget {
  final Widget child;
  final bool isBusy;
  final bool isUpgrading;
  final bool hasNoData;
  final String noDataMessage;
  final SCRResponseModel response;
  final Function retryAgain;
  final Function onRefresh;
  final bool isColorWhite;
  final bool isMaterialWaterDropHeaderEnabled;
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  final TextStyle textStyleWhite = TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: AppDimen.TEXT_SIZE_16);

  final TextStyle textStyleBlack = TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.black54,
      fontWeight: FontWeight.w600,
      fontSize: AppDimen.TEXT_SIZE_16);

  DataProcessViewWidget(
      {Key key,
        @required this.child,
        @required this.response,
        @required this.isBusy,
        this.isUpgrading = false,
        this.hasNoData = false,
        this.retryAgain,
        this.onRefresh,
        this.noDataMessage = "",
        this.isMaterialWaterDropHeaderEnabled = false,
        this.isColorWhite = false})
      : super(key: key);

  Widget _generateWidget() {
    if (isBusy) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                  isColorWhite ? Colors.white : AppColor.colorPrimary)),
        ),
      );
    } else if (response.responseStatus ==
        StaticDataManager.statusCodeNoInternet) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                AppStrings.noInternetConnection,
                style: isColorWhite ? textStyleWhite : textStyleBlack,
              ),
              FlatButton(
                  onPressed: () async {
                    if (retryAgain != null) retryAgain();
                  },
                  child: Text(
                    "Try Again",
                    style: isColorWhite
                        ? SCRTextStyles.defaultButtonTextStyleWhite
                        : SCRTextStyles.defaultButtonTextStyle,
                  ))
            ],
          ),
        ),
      );
    } else if (response.rawResponseStatus != StaticDataManager.statusCodeOk) {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Center(
            child: Text(
              response.responseMessage,
              style: isColorWhite ? textStyleWhite : textStyleBlack,
            )),
      );
    } else if (hasNoData) {
      return Center(
          child: Text(
            noDataMessage.isEmpty ? "You have not yet received any reminders" : noDataMessage,
            style: isColorWhite ? textStyleWhite : textStyleBlack,
          ));
    } else {
      return child;
    }
  }

  Widget _generateRefreshItemWidget() {
    return onRefresh != null
        ? SmartRefresher(
      child: _generateWidget(),
      controller: _refreshController,
      header: isMaterialWaterDropHeaderEnabled
          ? WaterDropMaterialHeader()
          : MaterialClassicHeader(),
      onRefresh: () {
        onRefresh();
        _refreshController.refreshCompleted();
      },
    )
        : _generateWidget();
  }

  @override
  Widget build(BuildContext context) {
    return isUpgrading
        ? Stack(
      children: <Widget>[
        _generateRefreshItemWidget(),
        Opacity(
            opacity: 0.6,
            child: Shimmer.fromColors(
                child: Container(
                  color: Colors.grey[300],
                ),
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                direction: ShimmerDirection.ltr))
      ],
    )
        : _generateRefreshItemWidget();
  }
}
