import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartnotestest/router.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_spacing.dart';
import 'package:smartnotestest/ui/widget/smartnoteTextfield.dart';


class Signup extends StatefulWidget
{
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController name_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController button_controller = TextEditingController();

  FocusNode name_node = FocusNode();
  FocusNode mail_node = FocusNode();
  FocusNode phone_node = FocusNode();
  FocusNode password_node = FocusNode();
  FocusNode button_node = FocusNode();

  _disposeall() {
    name_node.dispose();
    mail_node.dispose();
    phone_node.dispose();
    password_node.dispose();
    button_node.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColor.colorLoginScreen,
      body: Padding(
        padding: EdgeInsets.only(left: AppDimen.H_DIMEN_25,
          top: AppDimen.V_DIMEN_30,
          right: AppDimen.H_DIMEN_25,
          bottom: AppDimen.V_DIMEN_30,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "SignUp",
                style: TextStyle(
                  color: AppColor.colorHeadText1,
                  fontSize: 30,
                ),
              ),
              AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
              Text(
                "SignUp to your account",
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
                focusNode: name_node,
                textEditingController: name_controller,
                underlineColor: Colors.blue,
                prefixWidget: Text(
                  "Full Name",
                  style: TextStyle(
                      fontSize: AppDimen.TEXT_SIZE_16,
                      color: AppColor.colorLoginScreenText),
                ),
              ),
              AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
              SmartTextField(
                cursorColor: AppColor.colorLoginScreenText,
                isButton: false,
                focusNode: mail_node,
                textEditingController: email_controller,
                underlineColor: Colors.blue,
                prefixWidget: Text(
                  "Email Id",
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
                textEditingController: phone_controller,
                underlineColor: Colors.blue,
                prefixWidget: Text(
                  "Mobile No",
                  style: TextStyle(
                      fontSize: AppDimen.TEXT_SIZE_16,
                      color: AppColor.colorLoginScreenText),
                ),
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
                suffixWidget: Text("SHOW"),
              ),
              AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
              SmartTextField(
                isButton: true,
                focusNode: button_node,
                isButtonwidget: true,
                textEditingController: button_controller,
                buttonText: "SIGNUP",
                onTap: (){

                },
              ),
              AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
              Center(
                child: Text(
                  "Already have an account?",
                  style: TextStyle(color: AppColor.colorLoginText1,fontSize: AppDimen.TEXT_SIZE_18),
                ),
              ),
              AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
              Center(
                child: GestureDetector(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        color: AppColor.colorLoginText2,
                        fontSize: AppDimen.TEXT_SIZE_18),
                  ),
                  onTap: ()
                  {
                    Navigator.of(context).pushReplacementNamed(Router.ROUTE_LOGIN);
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