import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_spacing.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String _image;
  String imgPath = "assets/LogIn_crop.jpg";

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera,);
    setState(() {
      _image = image.path;
    });
  }

  _openGallery() async
  {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery,);
    setState(() {
      _image = image.path;
    });
  }

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
                          "Gallery",
                          style: TextStyle(
                            fontSize: AppDimen.TEXT_SIZE_15,
                            color: AppColor.colorProfiletext,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      _openGallery();
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
                          "Camera",
                          style: TextStyle(
                            fontSize: AppDimen.TEXT_SIZE_15,
                            color: AppColor.colorProfiletext,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      getImage();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColor.colorLoginScreen,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: AppDimen.V_DIMEN_18,
              left: AppDimen.H_DIMEN_8,
              right: AppDimen.H_DIMEN_8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
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
                IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    size: AppDimen.TEXT_SIZE_40,
                    color: AppColor.colorProfiletext,
                  ),
                  onPressed: () {
                    _showChoiceDialogue(context);
                  },
                )
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                left: AppDimen.H_DIMEN_20,
                top: AppDimen.V_DIMEN_10,
                right: AppDimen.H_DIMEN_20,
                bottom: AppDimen.V_DIMEN_10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Stack(
                    fit: StackFit.loose,
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          margin: EdgeInsets.all(
                            AppDimen.H_DIMEN_5,
                          ),
                          child: CircleAvatar(
                            backgroundColor: AppColor.colorProfilePic,
                            child: Container(
                              decoration: BoxDecoration(
//                                shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(

                                _image == null ? imgPath : _image,
                                alignment: Alignment.center,
                                fit: BoxFit.cover,
                                height: AppDimen.V_DIMEN_80,
                                width: AppDimen.H_DIMEN_80,
                              ),
                            ),
                            radius: AppDimen.V_DIMEN_60,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: AppDimen.V_DIMEN_80,
                            left: AppDimen.H_DIMEN_200),
                        child: IconButton(
                          color: Colors.white,
                          tooltip: "Click to update picture",
                          padding: EdgeInsets.all(10),
                          icon: Icon(
                            Icons.camera_alt,
                            size: AppDimen.V_DIMEN_30,
                            color: AppColor.colorProfiletext,
                          ),
                          onPressed: () {
                            _showChoiceDialogue(context);
                          },
                        ),
                      )
                    ],
                  ),
                  AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
                  Center(
                    child: Text(
                      "Alessandro Griffith",
                      style: TextStyle(
                        fontSize: AppDimen.TEXT_SIZE_35,
                        color: AppColor.colorProfiletext,
                      ),
                    ),
                  ),
                  AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
                  Center(
                    child: Container(
                      height: AppDimen.V_DIMEN_70,
                      width: AppDimen.H_DIMEN_250,
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
                                Icons.phone,
                                color: AppColor.colorLoginScreenButton,
                                size: AppDimen.TEXT_SIZE_22,
                              ),
                              AppSpacing.horizontalSpace(AppDimen.H_DIMEN_8),
                              Text(
                                "+1(666) 777-8888",
                                style: TextStyle(
                                  fontSize: AppDimen.TEXT_SIZE_22,
                                  color: AppColor.colorProfiletext,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
                  Center(
                    child: Container(
                      height: AppDimen.V_DIMEN_70,
                      width: AppDimen.H_DIMEN_250,
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
                            left: AppDimen.H_DIMEN_10,
                            right: AppDimen.H_DIMEN_5,
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.mail_outline,
                                color: AppColor.colorLoginScreenButton,
                                size: AppDimen.TEXT_SIZE_22,
                              ),
                              AppSpacing.horizontalSpace(AppDimen.H_DIMEN_8),
                              Text(
                                "alessa@gmail.com",
                                style: TextStyle(
                                  fontSize: AppDimen.TEXT_SIZE_22,
                                  color: AppColor.colorProfiletext,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
                  Center(
                    child: Container(
                      height: AppDimen.V_DIMEN_270,
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
                              right: AppDimen.H_DIMEN_20,
                              bottom: AppDimen.V_DIMEN_10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "About Us",
                                  style: TextStyle(
                                    fontSize: AppDimen.TEXT_SIZE_20,
                                    color: AppColor.colorProfiletext,
                                  ),
                                ),
                                AppSpacing.verticalSpace(AppDimen.V_DIMEN_10),
                                Text(
                                  "A student is a person who goes to school and is learning something. Students can be children, teenagers, or adults who are going to school, but it may also be other people who are learning, such as in college or university. ... A student can also be a person studying for a specific profession.",
                                  style: TextStyle(
                                    fontSize: AppDimen.TEXT_SIZE_17,
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
          )
        ],
      ),
    );
  }
}
