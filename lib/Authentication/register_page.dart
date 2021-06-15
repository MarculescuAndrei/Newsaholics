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
  Future<void>_alertDialogBuilder(String error) async {
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Error"),
          content: Container(
            child: Text(error),
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

  Future<String> _createAccount() async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail, password: _registerPassword);
      return null;
    }
    on FirebaseAuthException catch(e) {
      if(e.code == 'weak-password'){
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use'){
        return 'The account already exists for that email.';
      }
      return e.message;
    }
    catch(e){
      return e.toString();
    }
  }

  void _submitForm() async {
    setState(() {
      _registerFormLoading = true;
    });

    String _createAccountFeedback = await _createAccount();
    if (_createAccountFeedback != null) {
      _alertDialogBuilder(_createAccountFeedback);

      setState(() {
        _registerFormLoading = false;
      });
    }
    else {
    Navigator.pop(context);
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
          child: SingleChildScrollView(
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
                          onSubmitted: (value){
                            _submitForm();
                          },
                        ),
                        CustomButton(
                            text: "Sign up",
                            onPressed:(){

                              _submitForm();
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
          ),
        )
    );
  }
}
