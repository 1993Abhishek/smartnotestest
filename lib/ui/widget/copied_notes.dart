import 'package:flutter/material.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_spacing.dart';

class CopiedNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(
        bottom: AppDimen.V_DIMEN_10,
      ),
      child: Container(
        height: AppDimen.V_DIMEN_100,
        width: double.infinity,
//      padding: EdgeInsets.only(top: AppDimen.V_DIMEN_10,
//      ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: AppDimen.V_DIMEN_15,
              width: AppDimen.H_DIMEN_15,
              child: Image.asset(
                "assets/bullet.jpg",
              ),
            ),
            AppSpacing.horizontalSpace(AppDimen.H_DIMEN_10),
            Container(
              height: double.infinity,
              width: AppDimen.H_DIMEN_300,
              child: Text(
                "Biology is the natural science that studies life and living organisms, including their physical structure, chemical processes, molecular interactions, physiological mechanisms, development and evolution.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: AppDimen.TEXT_SIZE_15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
