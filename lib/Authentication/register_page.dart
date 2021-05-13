import 'package:firebase_auth/firebase_auth.dart';
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
  Future<void>_alertDialogBuilder() async {
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Error"),
          content: Container(
            child: Text("Rand txt"),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Close Dialog"),
            )
          ],
        );
      }
    );
  }

  Future<String> createAccount() async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail, password: _registerPassword);
      return null;
    }
     catch(e){
      return e.toString();
    }
  }

  bool _registerFormLoading = false;

  String _registerEmail = "";
  String _registerPassword = "";
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

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
                        onChanged: (value){
                          _registerEmail = value;
                        },
                        onSubmitted: (value) {
                          _passwordFocusNode.requestFocus();
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      CustomInput(
                        hintText: "Password . . .",
                        onChanged: (value){
                          _registerPassword = value;
                        },
                        focusNode: _passwordFocusNode,
                        isPasswordField: true,
                      ),
                      CustomButton(
                          text: "Sign up",
                          onPressed:(){
                            setState(() {
                              _registerFormLoading = true;
                            });
                          },
                          isLoading: _registerFormLoading,
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
