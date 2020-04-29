import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_spacing.dart';
import 'package:smartnotestest/ui/widget/smartnoteTextfield.dart';

class EditStagging extends StatefulWidget {
  @override
  _EditStaggingState createState() => _EditStaggingState();
}

class _EditStaggingState extends State<EditStagging> {
  TextEditingController _folderNameController;
  TextEditingController _folderTopicController;
  TextEditingController _filesNameController;
  TextEditingController _buttonController;

  FocusNode _folderNameNode;
  FocusNode _folderTopicNode;
  FocusNode _filesNameNode;
  FocusNode _buttonNode;

  @override
  void initState() {
    _folderNameController = TextEditingController();
    _folderTopicController = TextEditingController();
    _filesNameController = TextEditingController();
    _buttonController = TextEditingController();

    _folderNameNode = FocusNode();
    _folderTopicNode = FocusNode();
    _filesNameNode = FocusNode();
    _buttonNode = FocusNode();

    super.initState();
  }

  _dispose() {
    _folderNameNode.dispose();
    _filesNameNode.dispose();
    _folderTopicNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorLoginScreen,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: AppDimen.V_DIMEN_25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  FlatButton(
                    onPressed: (){},
                    color: AppColor.colorLoginScreen,
                    child: Container(
                      color: AppColor.colorLoginScreen,
                      height: AppDimen.V_DIMEN_25,
                      width: AppDimen.H_DIMEN_50,
                      child: Icon(
                        Icons.line_weight,
                        color: Colors.black,
                        size: AppDimen.V_DIMEN_30,
                      ),
                    ),
                  ),
                  Text(
                    "Edit Stagging",
                    style: TextStyle(fontSize: AppDimen.TEXT_SIZE_30),
                  ),
                  FlatButton(
                    onPressed: (){},
                    color: AppColor.colorLoginScreen,
                    child: Container(
                      height: AppDimen.V_DIMEN_25,
                      width: AppDimen.H_DIMEN_40,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: AppDimen.H_DIMEN_30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppSpacing.verticalSpace(AppDimen.V_DIMEN_20),
            Padding(
              padding: EdgeInsets.only(
                left: AppDimen.H_DIMEN_25,
                right: AppDimen.H_DIMEN_25,
                bottom: AppDimen.V_DIMEN_25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SmartTextField(
                    cursorColor: AppColor.colorLoginScreenText,
                    isButton: false,
                    focusNode: _folderNameNode,
                    textEditingController: _folderNameController,
                    underlineColor: Colors.blue,
                    prefixWidget: Text(
                      "Folder Name:( e.g Science )",
                      style: TextStyle(
                          fontSize: AppDimen.TEXT_SIZE_16,
                          color: AppColor.colorLoginScreenText),
                    ),
                  ),
                  AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
                  SmartTextField(
                    cursorColor: AppColor.colorLoginScreenText,
                    isButton: false,
                    focusNode: _folderTopicNode,
                    textEditingController: _folderTopicController,
                    underlineColor: Colors.blue,
                    prefixWidget: Text(
                      "Topic of the folder(e.g Biology)",
                      style: TextStyle(
                          fontSize: AppDimen.TEXT_SIZE_16,
                          color: AppColor.colorLoginScreenText),
                    ),
                  ),
                  AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
                  SmartTextField(
                    cursorColor: AppColor.colorLoginScreenText,
                    isButton: false,
                    focusNode: _filesNameNode,
                    textEditingController: _filesNameController,
                    underlineColor: Colors.blue,
                    prefixWidget: Text(
                      "Files Name",
                      style: TextStyle(
                          fontSize: AppDimen.TEXT_SIZE_16,
                          color: AppColor.colorLoginScreenText),
                    ),
                  ),
                  AppSpacing.verticalSpace(AppDimen.V_DIMEN_20),
                  SmartTextField(
                    isButton: true,
                    focusNode: _buttonNode,
                    isButtonwidget: true,
                    textEditingController: _buttonController,
                    buttonText: "SAVE",
                    onTap: () {
                      dispose();
                    },
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
