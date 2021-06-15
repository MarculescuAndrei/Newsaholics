import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsaholic/CustomWidgets/custom_button.dart';
import 'package:newsaholic/Views/home_page.dart';
import 'package:newsaholic/styles.dart';
import 'Authentication/landing_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
          primaryColor: Colors.white
      ),
      home: LandingPage(),
    );
  }

  Widget buildNews(BuildContext context) {
    return MaterialApp(
      title: 'Newsaholic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: WelcomePage(),
    );
  }
}

//check new branch

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: TextButton(
              child: Text("Logout",
                  style: TextStyle(color: Colors.black, fontSize: 14)
              ),
              onPressed: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LandingPage()),
                );
                FirebaseAuth.instance.signOut();
              }),
          leadingWidth: 82.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text("News"),
              Text("aholic", style: TextStyle(
                  color: Colors.grey
              ),)
            ],
          ),
          actions: <Widget>[
            Opacity(
              opacity: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.save)),
            )
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
                child: Text(
                  "Welcome, " + FirebaseAuth.instance.currentUser.email.substring(0, FirebaseAuth.instance.currentUser.email.indexOf("@")) + "!" ,
                  textAlign: TextAlign.center,
                  style: Styles.boldHeading,
                ),
              ),
              Container(
                padding: EdgeInsets.all(40.0),
                child: Text(
                  "Start reading today's news, browse categories such as Technology and Business, open any article you want and be ready to get updates from around the world!" ,
                  textAlign: TextAlign.center,
                  style: Styles.regularDarkText,
                ),
              ),
              CustomButton(
                  text: "Read news",
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
              )
            ]
        )
    );
  }
}
//check new branch