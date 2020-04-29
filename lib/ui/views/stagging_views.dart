import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_spacing.dart';
import 'package:smartnotestest/ui/widget/copied_notes.dart';

class StaggingView extends StatefulWidget {
  @override
  _StaggingViewState createState() => _StaggingViewState();
}

class _StaggingViewState extends State<StaggingView> {

  File _image;


  Future getImage() async {
    var image = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorLoginScreen,
      body: Padding(
        padding: EdgeInsets.only(
          left: AppDimen.H_DIMEN_20,
          right: AppDimen.H_DIMEN_20,
          top: AppDimen.V_DIMEN_20,
          bottom: AppDimen.V_DIMEN_15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(
                  Icons.dehaze,
                  color: AppColor.colorProfileHd1,
                  size: AppDimen.TEXT_SIZE_35,
                ),
                Text(
                  "Stagging",
                  style: TextStyle(
                    fontSize: AppDimen.TEXT_SIZE_35,
                    color: AppColor.colorProfileHd1,
                  ),
                ),
                GestureDetector(
                  onTap: getImage,
                  child: Icon(
                    Icons.camera_alt,
                    color: AppColor.colorProfileHd1,
                    size: AppDimen.TEXT_SIZE_35,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: AppDimen.H_DIMEN_160),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    child: CircleAvatar(
                      child: Padding(
                        padding: EdgeInsets.only(top: AppDimen.V_DIMEN_8),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.mode_edit,
                              color: AppColor.colorProfileHd1,
                              size: AppDimen.TEXT_SIZE_35,
                            ),
                            AppSpacing.verticalSpace(AppDimen.V_DIMEN_15),
                            Text(
                              "Edit",
                              style: TextStyle(
                                color: AppColor.colorProfiletext,
                                fontSize: AppDimen.TEXT_SIZE_24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      maxRadius: AppDimen.V_DIMEN_50,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  AppSpacing.horizontalSpace(AppDimen.H_DIMEN_20),
                  GestureDetector(
                    child: CircleAvatar(
                      child: Padding(
                        padding: EdgeInsets.only(top: AppDimen.V_DIMEN_8),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.text_fields,
                              color: AppColor.colorProfileHd1,
                              size: AppDimen.TEXT_SIZE_35,
                            ),
                            AppSpacing.verticalSpace(AppDimen.V_DIMEN_15),
                            Text(
                              "Add Text",
                              style: TextStyle(
                                color: AppColor.colorProfiletext,
                                fontSize: AppDimen.TEXT_SIZE_20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      maxRadius: AppDimen.V_DIMEN_50,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
//            AppSpacing.verticalSpace(AppDimen.V_DIMEN_15),
            Container(
              height: AppDimen.V_DIMEN_500,
              width: AppDimen.H_DIMEN_360,
              child: SingleChildScrollView(
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: AppDimen.H_DIMEN_15,
                      right: AppDimen.H_DIMEN_10,
                      top: AppDimen.V_DIMEN_25,
                      bottom: AppDimen.V_DIMEN_10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Copied notes",
                          style: TextStyle(
                            fontSize: AppDimen.TEXT_SIZE_24,
                            color: AppColor.colorProfiletext,
                          ),
                        ),
                        Container(
                            height: AppDimen.V_DIMEN_450,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return CopiedNotes();
                              },
                            ),
//                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
