import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class CustomInput extends StatelessWidget {

  final String hintText;
  CustomInput({this.hintText});

  @override
  Widget build(BuildContext context) {
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
