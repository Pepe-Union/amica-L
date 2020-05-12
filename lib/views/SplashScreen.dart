import 'dart:async';
import 'package:flutter/material.dart';

import '../FirebaseAuth.dart';


class SplashScreen extends StatefulWidget {
  static const String id = "SplashScreen";

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
            () => {Navigator.pushNamed(context, LoginPage.id)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white10, Colors.white])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 70.0, bottom: 20.0),
              child: new Container(
                padding: EdgeInsets.all(10.0),
                child: Image.asset("assets/images/flashscreen.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
