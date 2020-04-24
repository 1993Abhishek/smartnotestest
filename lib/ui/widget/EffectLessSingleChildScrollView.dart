import 'package:flutter/cupertino.dart';
import 'package:smartnotestest/ui/widget/scroll_configuration.dart';

class EffectLessSingleChildScrollView extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const EffectLessSingleChildScrollView(
      {Key key, @required this.child, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScrollConfiguration(
      child: SingleChildScrollView(
        padding: padding != null ? padding : EdgeInsets.all(0),
        child: child,
      ),
    );
  }
}
