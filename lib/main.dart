import 'package:coronapp/data.dart';

import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => new Scaffold(
              backgroundColor: Color(0xFF121517),
              body: Stack(
                children: <Widget>[
                  MenuDashboardPage(),
                ],
              ),
            ),
      },
    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
              Color(0xFF62676b),
              Color(0xFF131519),
            ]),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(left: 100.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/white-virus-min.png',
                          height: 150.0, width: 150.0),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "COVID-19",
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.3),
                      ),
                      Text(
                        "UPDATES",
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.3),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ]),
    );
  }
}
