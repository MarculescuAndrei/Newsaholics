import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsaholic/Authentication/home_page.dart';
import 'package:newsaholic/Authentication/login_page.dart';
import 'package:newsaholic/styles.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot){
          if(snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Error ${snapshot.error}"),
              ),
            );
          }

          if(snapshot.connectionState == ConnectionState.done){

            // Checks the login state live
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, streamSnapshot) {
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error ${streamSnapshot.error}"),
                    ),
                  );
                }


                if(streamSnapshot.connectionState == ConnectionState.active){
                  User _user = streamSnapshot.data;
                  if(_user == null){
                    return LoginPage();
                  }else {
                    return HomePage();
                  }
                }

                // Checking the auth state in Loading
                return Scaffold(
                  body: Container(
                    child: Center(
                        child: Text(
                          "Initializing App",
                          style: Styles.regularHeading,
                        )
                    ),
                  ),
                );
              },
            );
          }

          return Scaffold(
            body: Container(
              child: Center(
                  child: Text(
                      "Initializing App",
                      style: Styles.regularHeading,
                  )
              ),
            ),
          );
        }
    );
  }
}
