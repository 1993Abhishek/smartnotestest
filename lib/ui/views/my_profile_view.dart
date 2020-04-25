import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_spacing.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColor.colorLoginScreen,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            left: AppDimen.H_DIMEN_25,
            top: AppDimen.V_DIMEN_15,
            right: AppDimen.H_DIMEN_20,
            bottom: AppDimen.V_DIMEN_10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    Icons.view_headline,
                    size: AppDimen.TEXT_SIZE_40,
                  ),
                  AppSpacing.horizontalSpace(AppDimen.H_DIMEN_75),
                  Text(
                    "Profile",
                    style: TextStyle(
                        fontSize: AppDimen.TEXT_SIZE_40,
                        color: AppColor.colorProfileHd1),
                  ),
                  AppSpacing.horizontalSpace(AppDimen.H_DIMEN_75),
                  Icon(
                    Icons.camera_alt,
                    size: AppDimen.TEXT_SIZE_40,
                    color: AppColor.colorProfiletext,
                  ),
                ],
              ),
//              AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
              Center(
                child: CircleAvatar(
                  backgroundColor: AppColor.colorProfilePic,
                  child: Image.asset(
                    "assets/LogIn_crop.jpg",
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                  ),
                  radius: AppDimen.V_DIMEN_70,
                ),
              ),
              Center(
                child: Text(
                  "Alessandro Griffith",
                  style: TextStyle(
                    fontSize: AppDimen.TEXT_SIZE_40,
                    color: AppColor.colorProfiletext,
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: AppDimen.V_DIMEN_70,
                  width: AppDimen.H_DIMEN_300,
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimen.H_DIMEN_15,
                      ),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: AppDimen.H_DIMEN_20,
                        right: AppDimen.H_DIMEN_15,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                            color: AppColor.colorLoginScreenButton,
                            size: AppDimen.TEXT_SIZE_26,
                          ),
                          AppSpacing.horizontalSpace(AppDimen.H_DIMEN_10),
                          Text(
                            "+1(666) 777-8888",
                            style: TextStyle(
                              fontSize: AppDimen.TEXT_SIZE_26,
                              color: AppColor.colorProfiletext,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: AppDimen.V_DIMEN_70,
                  width: AppDimen.H_DIMEN_300,
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimen.H_DIMEN_15,
                      ),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: AppDimen.H_DIMEN_20,
                        right: AppDimen.H_DIMEN_5,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.mail_outline,
                            color: AppColor.colorLoginScreenButton,
                            size: AppDimen.TEXT_SIZE_26,
                          ),
                          AppSpacing.horizontalSpace(AppDimen.H_DIMEN_10),
                          Text(
                            "alessa@gmail.com",
                            style: TextStyle(
                              fontSize: AppDimen.TEXT_SIZE_26,
                              color: AppColor.colorProfiletext,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: AppDimen.V_DIMEN_320,
                  width: AppDimen.H_DIMEN_360,
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimen.H_DIMEN_15,
                      ),
                    ),
                    color: Colors.white,
                    child: Padding(
                        padding: EdgeInsets.only(
                          top: AppDimen.V_DIMEN_10,
                          left: AppDimen.H_DIMEN_20,
                          right: AppDimen.H_DIMEN_10,
                          bottom: AppDimen.V_DIMEN_2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "About Us",
                              style: TextStyle(
                                fontSize: AppDimen.TEXT_SIZE_24,
                                color: AppColor.colorProfiletext,
                              ),
                            ),
                            AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
                            Text(
                              "A student is a person who goes to school and is learning something. Students can be children, teenagers, or adults who are going to school, but it may also be other people who are learning, such as in college or university. ... A student can also be a person studying for a specific profession.",
                              style: TextStyle(
                                fontSize: AppDimen.TEXT_SIZE_20,
                                color: AppColor.colorProfiletext,
                              ),
                              textAlign: TextAlign.justify,
                            )

                          ],
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
