import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartnotestest/core/helper/pagination_helper.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_spacing.dart';

class NoteLibraryItem extends StatelessWidget {
  final Color color_1;
  final Color color_2;
  final String notebook_Name;
  final String subject_name;

  NoteLibraryItem({
    this.color_1,
    this.color_2,
    this.notebook_Name,
    this.subject_name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: AppDimen.V_DIMEN_200,
              width: AppDimen.H_DIMEN_25,
              color: color_1,
            ),
            Container(
              height: AppDimen.V_DIMEN_200,
              width: AppDimen.H_DIMEN_115,
              decoration: BoxDecoration(
                color: color_2,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    AppDimen.H_DIMEN_20,
                  ),
                  bottomRight: Radius.circular(
                    AppDimen.H_DIMEN_20,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Center(
                  child: Text(
                    notebook_Name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppDimen.TEXT_SIZE_17,
                    ),
                  ),
                ),
              ),
            ),
            AppSpacing.horizontalSpace(
              AppDimen.H_DIMEN_10,
            ),
          ],
        ),
        AppSpacing.verticalSpace(
          AppDimen.V_DIMEN_10,
        ),
        Text(
            subject_name,
            style: TextStyle(
              fontSize: AppDimen.TEXT_SIZE_17,
              color: AppColor.colorLoginText1,
            ),
          ),

      ],
    );
  }
}
