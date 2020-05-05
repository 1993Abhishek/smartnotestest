import 'package:flutter/material.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_spacing.dart';

class ReceivedNotesItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(
        bottom: AppDimen.V_DIMEN_10,
      ),
      child: Container(
        height: AppDimen.V_DIMEN_90,
        width: double.infinity,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimen.H_DIMEN_15,
            ),
          ),
          elevation: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: AppDimen.H_DIMEN_15,
                ),
                child: Center(
                  child: Container(
                    height: AppDimen.V_DIMEN_50,
                    width: AppDimen.H_DIMEN_50,
                    decoration: BoxDecoration(
                      color: AppColor.colorNotesLibraryItem1_B,
                      borderRadius: BorderRadius.circular(
                        AppDimen.V_DIMEN_5,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.rate_review,
                        size: AppDimen.H_DIMEN_20,
                      ),
                    ),
                  ),
                ),
              ),
              AppSpacing.horizontalSpace(
                AppDimen.H_DIMEN_30,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: AppDimen.V_DIMEN_10,
                  right: AppDimen.H_DIMEN_10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "From Alexa Ikon",
                      style: TextStyle(
                        color: AppColor.colorProfiletext,
                        fontSize: AppDimen.TEXT_SIZE_24,
                      ),
                    ),
                    AppSpacing.verticalSpace(
                      AppDimen.V_DIMEN_5,
                    ),
                    Text(
                      "Mar 20, 2020",
                      style: TextStyle(
                        color: AppColor.colorProfiletext,
                        fontSize: AppDimen.TEXT_SIZE_20,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
