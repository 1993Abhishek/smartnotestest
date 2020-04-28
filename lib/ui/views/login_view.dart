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
          left: AppDimen.H_DIMEN_25,
          top: AppDimen.V_DIMEN_30,
          right: AppDimen.H_DIMEN_25,
          bottom: AppDimen.V_DIMEN_25,
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
                  "Email_id",
                  style: TextStyle(
                      fontSize: AppDimen.TEXT_SIZE_16,
                      color: AppColor.colorLoginScreenText),
                ),
              ),
              AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
              SmartTextField(
                cursorColor: AppColor.colorLoginScreenText,
                isButton: false,
                focusNode: phone_node,
                textEditingController: phone_email_controller,
                underlineColor: Colors.blue,
                prefixWidget: Text(
                  "Password",
                  style: TextStyle(
                      fontSize: AppDimen.TEXT_SIZE_16,
                      color: AppColor.colorLoginScreenText),
                ),
              ),
              AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
              Padding(
                padding: EdgeInsets.only(left: AppDimen.H_DIMEN_170),
                child: Text(
                  "Forgot Password ?",
                  style: TextStyle(
                    fontSize: AppDimen.TEXT_SIZE_16,
                    color: AppColor.colorLoginScreenButton,
                  ),
                ),
              ),
              AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
              SmartTextField(
                isButton: true,
                focusNode: button_node,
                isButtonwidget: true,
                textEditingController: button_controller,
                buttonText: "LOGIN",
                onTap: ()
                {
                  dispose();
//                Navigator.of(context).pushNamed(Router.ROUTE_MY_PROFILE);
//                  Navigator.of(context).pushNamed(Router.ROUTE_TEXT_EDITING);
                  Navigator.of(context).pushNamed(Router.ROUTE_STAGGING);
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
      ),
    );
  }
}
