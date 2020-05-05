import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_spacing.dart';

class NoteLibraryText extends StatelessWidget {
  final Color color;
  final String heading_Name;
  final String description;

  NoteLibraryText({
    this.color,
    this.description,
    this.heading_Name,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(
        right: AppDimen.H_DIMEN_15,
        bottom: AppDimen.V_DIMEN_10,
      ),
      height: AppDimen.V_DIMEN_90,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: color,
            ),
            height: AppDimen.V_DIMEN_80,
            width: AppDimen.H_DIMEN_25,
//            color: AppColor.colorNotesLibraryItem1_B,
          ),
          AppSpacing.horizontalSpace(
            AppDimen.H_DIMEN_10,
          ),
          Container(
            height: AppDimen.V_DIMEN_100,
            width: AppDimen.H_DIMEN_250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  heading_Name,
                  style: TextStyle(
                    fontSize: AppDimen.TEXT_SIZE_17,
                    color: AppColor.colorProfileHd1,
                  ),
                ),
                AppSpacing.verticalSpace(
                  AppDimen.V_DIMEN_5,
                ),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: AppDimen.TEXT_SIZE_15,
                    color: AppColor.colorLoginText1,
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.horizontalSpace(
            AppDimen.H_DIMEN_40,
          ),
          Padding(
            padding: EdgeInsets.only(top:AppDimen.V_DIMEN_8,  ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: AppDimen.H_DIMEN_40,
                color: AppColor.colorLoginText1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
