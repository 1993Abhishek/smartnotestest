import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_spacing.dart';
import 'package:smartnotestest/ui/widget/received_notes_item.dart';

class ReceivedNotes extends StatefulWidget {
  @override
  _ReceivedNotesState createState() => _ReceivedNotesState();
}

class _ReceivedNotesState extends State<ReceivedNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorLoginScreen,
      body: Padding(
        padding: EdgeInsets.only(
          top: AppDimen.V_DIMEN_35,
          left: AppDimen.H_DIMEN_20,
          right: AppDimen.H_DIMEN_20,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.dehaze,
                  size: AppDimen.H_DIMEN_30,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:AppDimen.V_DIMEN_5,),
                child: Text(
                    "Received Notes",
                    style: TextStyle(
                      color: AppColor.colorProfileHd1,
                      fontSize: AppDimen.TEXT_SIZE_30,
                    ),
                  ),
              ),

              IconButton(
                icon: Icon(
                  Icons.local_bar,
                  size: AppDimen.H_DIMEN_30,
                  color: AppColor.colorLoginText1,
                ),
              )
            ],
          ),
          AppSpacing.verticalSpace(
            AppDimen.V_DIMEN_10,
          ),
          Container(
            height: AppDimen.V_DIMEN_580,
            width: AppDimen.H_DIMEN_400,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ReceivedNotesItem();
                }),
          ),
        ],),
      ),
    );
  }
}
