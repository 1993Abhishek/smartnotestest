import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LeftMenuItem {
  final int menuID;
  final String menuName;
  final IconData icon;

  LeftMenuItem({
    @required this.menuID,
    @required this.menuName,
    this.icon,
  });

  @override
  String toString() {
    return "Menu ID=$menuID, Menu Name=>$menuName";
  }
}
