import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsaholic/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Homepage",
          style: Styles.regularHeading,
        ),
      ),
    );
  }
}
