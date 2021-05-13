import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsaholic/Authentication/register_page.dart';
import 'package:newsaholic/CustomWidgets/custom_button.dart';
import 'package:newsaholic/CustomWidgets/custom_input.dart';

import '../styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  "Welcome fellow Newsaholic,\nLogin Here!",
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
                      text: "Login",
                      onPressed:(){
                      print("clicked login");
                      }
                  )
                ],
              ),
              CustomButton(
                text: "Create an Account",
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage()
                    )
                  );
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
