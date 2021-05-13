import 'package:firebase_auth/firebase_auth.dart';
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


  bool _loginFormLoading = false;
  String _loginEmail = "";
  String _loginPassword = "";
  FocusNode _passwordFocusNode;

  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                child: Text("Close Dialog"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        }
    );
  }

  Future<String> _loginAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _loginEmail, password: _loginPassword);
      return null;
    } on FirebaseAuthException catch(e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {
    setState(() {
      _loginFormLoading = true;
    });

    String _loginFeedback = await _loginAccount();

    if(_loginFeedback != null) {
      _alertDialogBuilder(_loginFeedback);

      setState(() {
        _loginFormLoading = false;
      });
    }
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
                  "Welcome fellow Newsaholic,\nLogin Here!",
                  textAlign: TextAlign.center,
                  style: Styles.boldHeading,
                ),
              ),
              Column(
                children: [
                  CustomInput(
                    hintText: "Email . . .",
                    onChanged: (value){
                      _loginEmail = value;
                    },
                    onSubmitted: (value){
                      _passwordFocusNode.requestFocus();
                    },
                  ),
                  CustomInput(
                    hintText: "Password . . .",
                    onChanged: (value){
                      _loginPassword = value;
                    },
                    focusNode: _passwordFocusNode,
                    isPasswordField: true,
                    onSubmitted: (value){
                      _submitForm();
                    },
                  ),
                  CustomButton(
                      text: "Login",
                      onPressed:(){
                        _submitForm();
                      },
                    isLoading: _loginFormLoading,
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
