import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Heading"),
            Text("Input Fields"),
            Text("Create Account"),
          ],
        ),
      )
    );
  }
}
