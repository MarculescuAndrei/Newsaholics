import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class CustomInput extends StatelessWidget {

  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final bool isPasswordField;
  CustomInput({this.hintText, this.onChanged, this.onSubmitted, this.focusNode, this.textInputAction, this.isPasswordField});

  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = isPasswordField ?? false;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(9.0)
      ),
      child: TextField(
        obscureText: _isPasswordField,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,

        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText ?? "Hint",
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 19.0,
          )
        ),
      style: Styles.regularDarkText,
      ),
    );
  }
}
