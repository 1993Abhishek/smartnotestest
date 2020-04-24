import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';

// ignore: must_be_immutable
class SCRTextField extends StatefulWidget {
  final String hintText;
  final String valueText;
  final TextStyle textStyle;
  final TextStyle hintStyle;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool isObscureText;
  final Function onSubmitted;
  final Function onChange;
  final Function onTap;
  final bool isReadOnly;
  final bool isHiddenLines;
  final int maxLines;
  final int maxLength;
  final List<TextInputFormatter> inputFormatter;
  final Widget prefixWidget;
  final Widget suffixWidget;
  final Color cursorColor;
  final Color underlineActiveColor;
  final Color underlineColor;
  final TextEditingController textEditingController;
  final TextCapitalization textCapitalization;
  final String errorText;
  final String lebelText;
  FocusNode focusNode;

  SCRTextField(
      {Key key,
      @required this.textEditingController,
      @required this.focusNode,
      this.hintText = "",
      this.valueText = "",
      this.textStyle,
      this.hintStyle,
      this.textInputAction = TextInputAction.done,
      this.textInputType = TextInputType.text,
      this.isObscureText = false,
      this.inputFormatter,
      this.onChange,
      this.onTap,
      this.maxLines,
      this.maxLength,
      this.isReadOnly = false,
      this.isHiddenLines = false,
      this.onSubmitted,
      this.prefixWidget,
      this.suffixWidget,
      this.textCapitalization,
      this.cursorColor = Colors.white,
      this.underlineActiveColor,
      this.lebelText,
      this.errorText = "",
      this.underlineColor})
      : super(key: key);

  @override
  _SCRTextFieldState createState() => _SCRTextFieldState();
}

class _SCRTextFieldState extends State<SCRTextField> {
  @override
  void initState() {
    _setUpInitials();
    super.initState();
  }

  void _focusChangeListener() {
    setState(() {});
  }

  _setUpInitials() {
    widget.focusNode.addListener(_focusChangeListener);
    widget.textEditingController.text = widget.valueText;
  }

  @override
  Widget build(BuildContext context) {
    _setUpInitials();
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              widget.prefixWidget != null
                  ? Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: AppDimen.H_DIMEN_8,
                              right: AppDimen.H_DIMEN_8),
                          child: Container(
                            height: AppDimen.H_DIMEN_30,
                            width: AppDimen.H_DIMEN_30,
                            child: widget.prefixWidget,
                          ),
                        ),
                        !widget.isHiddenLines
                            ? Container(
                                width: widget.focusNode.hasFocus ? 1.2 : 1,
                                height: AppDimen.H_DIMEN_40,
                                color: widget.focusNode.hasFocus
                                    ? (widget.underlineActiveColor != null
                                        ? widget.underlineActiveColor
                                        : AppColor.colorTextFieldUnderLine2)
                                    : (widget.underlineColor != null
                                        ? widget.underlineColor
                                        : AppColor.colorTextFieldUnderLine),
                              )
                            : Container(),
                      ],
                    )
                  : Container(
                      height: AppDimen.H_DIMEN_40,
                    ),
              Expanded(
                child: TextField(
                  cursorColor: widget.cursorColor,
                  focusNode: widget.focusNode,
                  maxLines: widget.maxLines == null ? 1 : widget.maxLines,
                  maxLength: widget.maxLength,
                  autofocus: false,
                  controller: widget.textEditingController,
                  inputFormatters: widget.inputFormatter != null
                      ? widget.inputFormatter
                      : <TextInputFormatter>[],
                  textInputAction: widget.textInputAction,
                  textCapitalization: widget.textCapitalization != null
                      ? widget.textCapitalization
                      : TextCapitalization.none,
                  style: widget.textStyle == null
                      ? TextStyle(
                          color: Colors.black,
                          fontSize: AppDimen.TEXT_SIZE_18,
                          fontFamily: "Viga",
                          fontWeight: FontWeight.w400,
                        )
                      : widget.textStyle,
                  onSubmitted: (value) {
                    if (widget.onSubmitted != null) widget.onSubmitted(value);
                  },
                  onChanged: (value) {
                    if (widget.onChange != null) widget.onChange(value);
                  },
                  onTap: () {
                    if (widget.onTap != null) widget.onTap();
                  },
                  keyboardType: widget.textInputType,
                  obscureText: widget.isObscureText,
                  readOnly: widget.isReadOnly,
                  decoration: InputDecoration(
                    labelText: widget.lebelText,
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    counterText: "",
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(bottom: 10),
                    hintText: widget.hintText,
                    errorStyle: TextStyle(color: Colors.white),
                    hintStyle: widget.hintStyle != null
                        ? widget.hintStyle
                        : TextStyle(
                            color: Colors.black,
                            fontSize: AppDimen.TEXT_SIZE_22),
                  ),
                ),
              ),
              widget.suffixWidget != null ? widget.suffixWidget : Container()
            ],
          ),
          !widget.isHiddenLines
              ? Container(
                  height: widget.focusNode.hasFocus ? 1.2 : 1,
                  color: widget.focusNode.hasFocus
                      ? (widget.underlineActiveColor != null
                          ? widget.underlineActiveColor
                          : AppColor.colorTextFieldUnderLineActive)
                      : (widget.underlineColor != null
                          ? widget.underlineColor
                          : AppColor.colorTextFieldUnderLine2),
                )
              : Container(),
          widget.errorText.isNotEmpty
              ? Container(
                  margin: EdgeInsets.only(top: AppDimen.H_DIMEN_3),
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.errorText,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: AppDimen.TEXT_SIZE_12,
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
