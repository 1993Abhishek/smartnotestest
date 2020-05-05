import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';

class NotesLibrary extends StatefulWidget {
  @override
  _NotesLibraryState createState() => _NotesLibraryState();
}

class _NotesLibraryState extends State<NotesLibrary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorLoginScreen,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: AppDimen.V_DIMEN_25,
              left: AppDimen.H_DIMEN_15,
              right: AppDimen.H_DIMEN_15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.dehaze,
                    size: AppDimen.H_DIMEN_25,
                  ),
                ),
                Text(
                  "Notes Library",
                  style: TextStyle(
                    fontSize: AppDimen.TEXT_SIZE_24,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    size: AppDimen.V_DIMEN_25,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
