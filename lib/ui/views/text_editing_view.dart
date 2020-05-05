import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:smartnotestest/router.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_spacing.dart';
import 'package:smartnotestest/ui/widget/smartnoteTextfield.dart';
import 'package:zefyr/zefyr.dart';

class TextEditing extends StatefulWidget {
  @override
  _TextEditingState createState() => _TextEditingState();
}

class _TextEditingState extends State<TextEditing> {
  ZefyrController _zefyrController;
  FocusNode _focusNode;
  FocusNode button_node;
  TextEditingController button_controller;

  @override
  void initState() {
    super.initState();
    final document = _loadDocument();
    _zefyrController = ZefyrController(document);
    _focusNode = FocusNode();
    button_node = FocusNode();
    button_controller = TextEditingController();
  }

  _disposeAll() {
    _focusNode.dispose();
    button_node.dispose();
  }

  NotusDocument _loadDocument() {
    final Delta delta = Delta()..insert("Start Typing\n");
    return NotusDocument.fromDelta(delta);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColor.colorLoginScreen,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: AppDimen.V_DIMEN_40,
                  left: AppDimen.H_DIMEN_10,
                  right: AppDimen.H_DIMEN_10,
                  bottom: AppDimen.V_DIMEN_10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: AppColor.colorLoginScreen,
                      child: Container(
                        color: AppColor.colorLoginScreen,
                        height: AppDimen.V_DIMEN_25,
                        width: AppDimen.H_DIMEN_50,
                        child: Icon(
                          Icons.clear,
                          color: Colors.black,
                          size: AppDimen.V_DIMEN_35,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:AppDimen.V_DIMEN_8,),
                      child: Text(
                        "Text Editor",
                        style: TextStyle(fontSize: AppDimen.TEXT_SIZE_35),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      color: AppColor.colorLoginScreen,
                      child: Container(
                        height: AppDimen.V_DIMEN_25,
                        width: AppDimen.H_DIMEN_40,
                        child: Icon(
                          Icons.check,
                          color: Colors.black,
                          size: AppDimen.H_DIMEN_35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: AppDimen.V_DIMEN_450,
                  width: AppDimen.H_DIMEN_360,
                  child: Card(
                    child: ZefyrScaffold(
                      child: ZefyrEditor(
                        physics: ClampingScrollPhysics(),
                        keyboardAppearance: Brightness.dark,
                        autofocus: true,
                        mode: ZefyrMode.edit,
                        padding: EdgeInsets.all(AppDimen.V_DIMEN_10),
                        controller: _zefyrController,
                        focusNode: _focusNode,
                      ),
                    ),
                  ),
                ),
              ),
              AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
              Padding(
                padding: EdgeInsets.only(
                  left: AppDimen.H_DIMEN_40,
//                  top: AppDimen.V_DIMEN_10,
                  right: AppDimen.H_DIMEN_35,
                  bottom: AppDimen.V_DIMEN_25,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: AppDimen.V_DIMEN_70,
                      width: AppDimen.H_DIMEN_300,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimen.H_DIMEN_25,
                          ),
                        ),
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: AppDimen.H_DIMEN_15,
                            right: AppDimen.H_DIMEN_10,
                            top: AppDimen.V_DIMEN_5,
                            bottom: AppDimen.V_DIMEN_8,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.undo,
                                    size: AppDimen.TEXT_SIZE_26,
                                  ),
                                  Text(
                                    "Undo",
                                    style: TextStyle(
                                      fontSize: AppDimen.TEXT_SIZE_15,
                                    ),
                                  ),
                                ],
                              ),
                              AppSpacing.horizontalSpace(
                                AppDimen.H_DIMEN_20,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.border_color,
                                    size: AppDimen.TEXT_SIZE_26,
                                  ),
                                  Text(
                                    "Erase",
                                    style: TextStyle(
                                      fontSize: AppDimen.TEXT_SIZE_15,
                                    ),
                                  ),
                                ],
                              ),
                              AppSpacing.horizontalSpace(AppDimen.H_DIMEN_20,),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.format_underlined,
                                    size: AppDimen.TEXT_SIZE_26,
                                  ),
                                  Text(
                                    "Underline",
                                    style: TextStyle(
                                      fontSize: AppDimen.TEXT_SIZE_15,
                                    ),
                                  ),
                                ],
                              ),
                              AppSpacing.horizontalSpace(AppDimen.H_DIMEN_20),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.fiber_manual_record,
                                    size: AppDimen.TEXT_SIZE_26,
                                  ),
                                  Text(
                                    "Highlight",
                                    style: TextStyle(
                                      fontSize: AppDimen.TEXT_SIZE_15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AppSpacing.verticalSpace(
                      AppDimen.V_DIMEN_10,
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        height: AppDimen.V_DIMEN_70,
                        width: double.infinity,
                        child: Card(
                          color: AppColor.colorLoginScreenButton,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppDimen.H_DIMEN_15)),
                          elevation: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: AppDimen.H_DIMEN_100),
                                child: Text(
                                  "Transfer file",
                                  style: TextStyle(
                                    color: AppColor.colorLoginButtonText,
                                    fontSize: AppDimen.TEXT_SIZE_24,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: AppDimen.H_DIMEN_10,
                                ),
                                child: CircleAvatar(
                                  radius: AppDimen.H_DIMEN_25,
                                  backgroundColor: AppColor.colorLoginButtonCircle,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: AppColor.colorLoginButtonText,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
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
