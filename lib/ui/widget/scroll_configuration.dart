import 'package:flutter/material.dart';

class AppScrollConfiguration extends StatelessWidget {
  final Widget child;

  AppScrollConfiguration({this.child});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: EffectLessScrollBehavior(),
      child: child,
    );
  }
}

class EffectLessScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
