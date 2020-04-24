import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartnotestest/ui/helper/app_colors.dart';
import 'package:smartnotestest/ui/helper/app_dimen.dart';
import 'package:smartnotestest/ui/helper/app_spacing.dart';

class SmartTextField extends StatefulWidget {
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

  final String buttonText;
  final bool isButton;
  final bool isButtonwidget;

  FocusNode focusNode;

  SmartTextField(
      {Key key,
      @required this.textEditingController,
      @required this.focusNode,
      @required this.isButton,
      this.isButtonwidget,
      this.buttonText,

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
  _SmartTextFieldState createState() => _SmartTextFieldState();
}

class _SmartTextFieldState extends State<SmartTextField> {
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
    return widget.isButton
        ? GestureDetector(
      onTap: widget.onTap,
          child: Container(
              height: AppDimen.V_DIMEN_70,
              width: AppDimen.H_DIMEN_350,
              child: Card(
                color: AppColor.colorLoginScreenButton,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimen.H_DIMEN_15)),
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppDimen.H_DIMEN_35,
                    top: AppDimen.H_DIMEN_15,
                    bottom: AppDimen.H_DIMEN_10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: AppDimen.H_DIMEN_90,
                        ),
                        child: Text(
                          widget.buttonText,
                          style: TextStyle(
                            color: AppColor.colorLoginButtonText,
                            fontSize: AppDimen.TEXT_SIZE_24,
                          ),
                        ),
                      ),
                      AppSpacing.horizontalSpace(AppDimen.H_DIMEN_60),
                      widget.isButtonwidget
                          ? CircleAvatar(
                              radius: AppDimen.H_DIMEN_30,
                              backgroundColor: AppColor.colorLoginButtonCircle,
                              child: Icon(
                                Icons.arrow_forward,
                                color: AppColor.colorLoginButtonText,
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
        )
        : Container(
            height: AppDimen.V_DIMEN_80,
            width: AppDimen.H_DIMEN_350,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimen.H_DIMEN_15),
              ),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppDimen.H_DIMEN_25,
                  top: AppDimen.H_DIMEN_25,
                  bottom: AppDimen.H_DIMEN_20,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    widget.prefixWidget,
                    AppSpacing.horizontalSpace(AppDimen.H_DIMEN_12),
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
                          if (widget.onSubmitted != null)
                            widget.onSubmitted(value);
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
//                    AppSpacing.horizontalSpace(AppDimen.H_DIMEN_5),
                    widget.suffixWidget == null
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.only(right: AppDimen.H_DIMEN_8),
                            child: widget.suffixWidget,
                          ),
                  ],
                ),
              ),
            ),
          );
  }
}
