import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartnotestest/router.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_spacing.dart';
import 'package:smartnotestest/ui/widget/smartnoteTextfield.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool routeProfile = false;
  bool routeStaging = false;
  bool routeEditing = false;
  bool routeEditStaging = false;
  bool routeNotesLibrary = false;
  bool routeReceivedNotes = false;

  Future<void> _showChoiceDialogue(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Select",
                style: TextStyle(
                  fontSize: AppDimen.TEXT_SIZE_20,
                  color: AppColor.colorProfilePic,
                ),
              ),
            ),
            elevation: 10,
            backgroundColor: AppColor.colorLoginScreen,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
//                      color: Colors.blueAccent,
                      width: AppDimen.H_DIMEN_50,
                      height: AppDimen.V_DIMEN_30,
                      child: Center(
                        child: Text(
                          "My Profile",
                          style: TextStyle(
                            fontSize: AppDimen.TEXT_SIZE_15,
                            color: AppColor.colorProfiletext,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (!routeStaging &&
                          !routeEditing &&
                          !routeProfile &&
                          !routeEditStaging &&
                          !routeNotesLibrary &&
                          !routeReceivedNotes) {
                        dispose();
                        routeProfile = true;
                      }
                      Navigator.of(context).pushNamed(Router.ROUTE_MY_PROFILE);
                    },
                  ),
                  AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
//                      color: Colors.blueAccent,
                      width: AppDimen.H_DIMEN_50,
                      height: AppDimen.V_DIMEN_30,
                      child: Center(
                        child: Text(
                          "Stagging",
                          style: TextStyle(
                            fontSize: AppDimen.TEXT_SIZE_15,
                            color: AppColor.colorProfiletext,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (!routeStaging &&
                          !routeEditing &&
                          !routeProfile &&
                          !routeEditStaging &&
                          !routeNotesLibrary &&
                          !routeReceivedNotes) {
                        dispose();
                        routeStaging = true;
                      }
                      Navigator.of(context).pushNamed(Router.ROUTE_STAGGING);
                    },
                  ),
                  AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
//                      color: Colors.blueAccent,
                      width: AppDimen.H_DIMEN_50,
                      height: AppDimen.V_DIMEN_30,
                      child: Center(
                        child: Text(
                          "Text Editing",
                          style: TextStyle(
                            fontSize: AppDimen.TEXT_SIZE_15,
                            color: AppColor.colorProfiletext,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (!routeStaging &&
                          !routeEditing &&
                          !routeProfile &&
                          !routeEditStaging &&
                          !routeNotesLibrary &&
                          !routeReceivedNotes) {
                        dispose();
                        routeEditing = true;
                      }
                      Navigator.of(context)
                          .pushNamed(Router.ROUTE_TEXT_EDITING);
                    },
                  ),
                  AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
//                      color: Colors.blueAccent,
                      width: AppDimen.H_DIMEN_50,
                      height: AppDimen.V_DIMEN_30,
                      child: Center(
                        child: Text(
                          "Stag Editing",
                          style: TextStyle(
                            fontSize: AppDimen.TEXT_SIZE_15,
                            color: AppColor.colorProfiletext,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (!routeStaging &&
                          !routeEditing &&
                          !routeProfile &&
                          !routeEditStaging &&
                          !routeNotesLibrary &&
                          !routeReceivedNotes) {
                        dispose();
                        routeEditStaging = true;
                      }
                      Navigator.of(context)
                          .pushNamed(Router.ROUTE_EDIT_STAGGING);
                    },
                  ),
                  AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
//                      color: Colors.blueAccent,
                      width: AppDimen.H_DIMEN_50,
                      height: AppDimen.V_DIMEN_30,
                      child: Center(
                        child: Text(
                          "Notes Library",
                          style: TextStyle(
                            fontSize: AppDimen.TEXT_SIZE_15,
                            color: AppColor.colorProfiletext,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (!routeStaging &&
                          !routeEditing &&
                          !routeProfile &&
                          !routeEditStaging &&
                          !routeNotesLibrary &&
                          !routeReceivedNotes) {
                        dispose();
                        routeNotesLibrary = true;
                      }
                      Navigator.of(context)
                          .pushNamed(Router.ROUTE_NOTES_LIBRARY);
                    },
                  ),
                  AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
//                      color: Colors.blueAccent,
                      width: AppDimen.H_DIMEN_50,
                      height: AppDimen.V_DIMEN_30,
                      child: Center(
                        child: Text(
                          "Received Notes",
                          style: TextStyle(
                            fontSize: AppDimen.TEXT_SIZE_15,
                            color: AppColor.colorProfiletext,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (!routeStaging &&
                          !routeEditing &&
                          !routeProfile &&
                          !routeEditStaging &&
                          !routeNotesLibrary &&
                          !routeReceivedNotes) {
                        dispose();
                        routeReceivedNotes = true;
                      }
                      Navigator.of(context).pushNamed(
                        Router.ROUTE_RECEIVED_NOTES,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  TextEditingController phone_email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController button_controller = TextEditingController();

  FocusNode phone_node = FocusNode();
  FocusNode password_node = FocusNode();
  FocusNode button_node = FocusNode();

  _disposeall() {
    phone_node.dispose();
    password_node.dispose();
    button_node.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorLoginScreen,
      body: Padding(
        padding: EdgeInsets.only(
          left: AppDimen.H_DIMEN_20,
          top: AppDimen.V_DIMEN_50,
          right: AppDimen.H_DIMEN_25,
          bottom: AppDimen.V_DIMEN_10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Welcome",
                style: TextStyle(
                  color: AppColor.colorHeadText1,
                  fontSize: 30,
                ),
              ),
              AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
              Text(
                "Enter your email or phone number",
                style: TextStyle(
                  color: AppColor.colorHeadText2,
                  fontSize: 20,
                ),
              ),
              AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
              Padding(
                padding: EdgeInsets.only(
                  left: AppDimen.H_DIMEN_10,
                  right: AppDimen.H_DIMEN_10,
                ),
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/LogIn_crop.jpg"),
                    ),
//            AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
                    SmartTextField(
                      cursorColor: AppColor.colorLoginScreenText,
                      isButton: false,
                      focusNode: phone_node,
                      textEditingController: phone_email_controller,
                      underlineColor: Colors.blue,
                      prefixWidget: Text(
                        "Email id",
                        style: TextStyle(
                            fontSize: AppDimen.TEXT_SIZE_16,
                            color: AppColor.colorLoginScreenText),
                      ),
                      onSubmitted: (value) {
                        phone_node.unfocus();
                        password_node.requestFocus();
                      },
                    ),
                    AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
                    SmartTextField(
                      cursorColor: AppColor.colorLoginScreenText,
                      isButton: false,
                      focusNode: password_node,
                      textEditingController: password_controller,
                      underlineColor: Colors.blue,
                      prefixWidget: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: AppDimen.TEXT_SIZE_16,
                            color: AppColor.colorLoginScreenText),
                      ),
                      onSubmitted: (value) {
                        password_node.unfocus();
                        button_node.requestFocus();
                      },
                    ),
                    AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
                    Padding(
                      padding: EdgeInsets.only(left: AppDimen.H_DIMEN_200),
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          fontSize: AppDimen.TEXT_SIZE_16,
                          color: AppColor.colorLoginScreenButton,
                        ),
                      ),
                    ),
                    AppSpacing.verticalSpace(AppDimen.V_DIMEN_20),
                    SmartTextField(
                      isButton: true,
                      focusNode: button_node,
                      isButtonwidget: true,
                      textEditingController: button_controller,
                      buttonText: "LOGIN",
                      onTap: () {
//                  dispose();
                        _showChoiceDialogue(context);
//                Navigator.of(context).pushNamed(Router.ROUTE_MY_PROFILE);
//                  Navigator.of(context).pushNamed(Router.ROUTE_TEXT_EDITING);
//                  Navigator.of(context).pushNamed(Router.ROUTE_STAGGING);
                      },
                    ),
                    AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
                    Center(
                      child: Text(
                        "Dont have an account?",
                        style: TextStyle(
                            color: AppColor.colorLoginText1,
                            fontSize: AppDimen.TEXT_SIZE_18),
                      ),
                    ),
                    AppSpacing.verticalSpace(AppDimen.V_DIMEN_5),
                    Center(
                      child: GestureDetector(
                        child: Text(
                          "SIGNUP",
                          style: TextStyle(
                              color: AppColor.colorLoginText2,
                              fontSize: AppDimen.TEXT_SIZE_18),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Router.ROUTE_REGISTRATION);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
