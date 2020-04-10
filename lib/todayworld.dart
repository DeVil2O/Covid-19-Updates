import 'package:flutter/material.dart';

class TodayWorld extends StatefulWidget {
  @override
  _TodayWorldState createState() => _TodayWorldState();
}

class _TodayWorldState extends State<TodayWorld> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF121517),
      ),
    );
  }
}
