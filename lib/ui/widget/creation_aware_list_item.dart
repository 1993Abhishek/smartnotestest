import 'package:flutter/material.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';

class CreationAwareListItem extends StatefulWidget {
  final Function itemCreated;
  final Widget child;
  final bool isLoading;

  const CreationAwareListItem({
    Key key,
    @required this.itemCreated,
    @required this.child,
    @required this.isLoading,
  }) : super(key: key);

  @override
  _CreationAwareListItemState createState() => _CreationAwareListItemState();
}

class _CreationAwareListItemState extends State<CreationAwareListItem> {
  @override
  void initState() {
    super.initState();
    if (widget.itemCreated != null) {
      widget.itemCreated();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isLoading
        ? Padding(
            padding: EdgeInsets.all(AppDimen.H_DIMEN_10),
            child: Center(
              child: SizedBox(
                height: AppDimen.H_DIMEN_35,
                width: AppDimen.H_DIMEN_35,
                child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        AppColor.colorLoadingIndicator)),
              ),
            ),
          )
        : widget.child;
  }
}
