import 'package:coronapp/aboutme.dart';
import 'package:coronapp/allcount.dart';
import 'package:coronapp/prevention.dart';
import 'package:coronapp/symptom.dart';
import 'package:coronapp/todayworld.dart';
import 'package:flutter/material.dart';

class Routing extends StatefulWidget {
  @override
  _RoutingState createState() => _RoutingState();
}

class _RoutingState extends State<Routing> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Symptoms()),
            );
          },
          child: Text("Symptoms",
              style: TextStyle(color: Colors.grey, fontSize: 22)),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Prevention()),
            );
          },
          child: Text("Prevention",
              style: TextStyle(color: Colors.grey, fontSize: 22)),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AllCountries()),
            );
          },
          child: Text("Today's World",
              style: TextStyle(color: Colors.grey, fontSize: 22)),
        ),
        SizedBox(height: 20),
        // GestureDetector(
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => SecondRoute()),
        //     );
        //   },
        //   child:
        //       Text("News", style: TextStyle(color: Colors.grey, fontSize: 22)),
        // ),
        // SizedBox(height: 20.0),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => About()),
            );
          },
          child:
              Text("About", style: TextStyle(color: Colors.grey, fontSize: 22)),
        ),
      ],
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
