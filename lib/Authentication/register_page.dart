import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsaholic/CustomWidgets/custom_button.dart';
import 'package:newsaholic/CustomWidgets/custom_input.dart';

import '../styles.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top:100.0),
                    child: Text(
                      "Create a new Account!",
                      textAlign: TextAlign.center,
                      style: Styles.boldHeading,
                    ),
                  ),
                  Column(
                    children: [
                      CustomInput(
                        hintText: "Email . . .",
                      ),
                      CustomInput(
                        hintText: "Password . . .",
                      ),
                      CustomButton(
                          text: "Sign up",
                          onPressed:(){
                            print("clicked signup");
                          }
                      )
                    ],
                  ),
                  CustomButton(
                    text: "Back to login",
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    outlineBtn: false,
                  ),
                ],
              )
          ),
        )
    );
  }
}
