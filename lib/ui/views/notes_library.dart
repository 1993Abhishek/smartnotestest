import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_spacing.dart';
import 'package:smartnotestest/ui/widget/note_library_item.dart';
import 'package:smartnotestest/ui/widget/note_library_text.dart';

class NotesLibrary extends StatefulWidget {
  @override
  _NotesLibraryState createState() => _NotesLibraryState();
}

class _NotesLibraryState extends State<NotesLibrary> {
  List<Color> colors_1 = [
    AppColor.colorNotesLibraryItem1_A,
    AppColor.colorNotesLibraryItem2_A,
    AppColor.colorNotesLibraryItem3_A,
  ];
  List<Color> colors_2 = [
    AppColor.colorNotesLibraryItem1_B,
    AppColor.colorNotesLibraryItem2_B,
    AppColor.colorNotesLibraryItem3_B,
  ];

  List note_books_name = [
    "Science Notebook",
    "Litrature Notebook",
    "History Notebook",
  ];

  List subject_names = [
    "Science",
    "Literature",
    "History",
  ];

  List headings = [
    "Biology",
    "Chemistry",
    "Maths",
    "Physics",
  ];

  List<Color> textLabelColors = [
    AppColor.colorNotesLibrary_1,
    AppColor.colorNotesLibrary_2,
    AppColor.colorNotesLibrary_3,
    AppColor.colorNotesLibrary_4,
  ];

  final String description =
      "Science is the study of the nature and behaviour of natural things.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorLoginScreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: AppDimen.V_DIMEN_35,
              left: AppDimen.H_DIMEN_10,
              right: AppDimen.H_DIMEN_10,
            ),
            child: Row(
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
                    "Notes Library",
                    style: TextStyle(
                      color: AppColor.colorProfileHd1,
                      fontSize: AppDimen.TEXT_SIZE_30,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    size: AppDimen.H_DIMEN_30,
                    color: AppColor.colorLoginText1,
                  ),
                )
              ],
            ),
          ),
          AppSpacing.verticalSpace(
            AppDimen.V_DIMEN_15,
          ),
          Container(
            padding: EdgeInsets.only(
              bottom: AppDimen.V_DIMEN_10,
              left: AppDimen.H_DIMEN_20,
            ),
            height: AppDimen.V_DIMEN_250,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: note_books_name.length,
                itemBuilder: (context, index) {
                  return NoteLibraryItem(
                    color_1: colors_1[index],
                    color_2: colors_2[index],
                    notebook_Name: note_books_name[index],
                    subject_name: subject_names[index],
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: AppDimen.V_DIMEN_10,
              left: AppDimen.H_DIMEN_20,
              right: AppDimen.H_DIMEN_15,
              bottom: AppDimen.V_DIMEN_20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Science",
                  style: TextStyle(
                    fontSize: AppDimen.TEXT_SIZE_24,
                  ),
                ),
                Container(
                  height: AppDimen.V_DIMEN_360,
                  width: AppDimen.H_DIMEN_400,
                  child: ListView.builder(
                      itemCount: textLabelColors.length,
                      itemBuilder: (context, index) {
                        return NoteLibraryText(
                          color: textLabelColors[index],
                          heading_Name: headings[index],
                          description: description,
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
