import 'package:flutter/material.dart';

class Symptoms extends StatefulWidget {
  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF121517),
        body: Stack(
          children: <Widget>[
            // Text("Hello", style: TextStyle(color: Colors.grey, fontSize: 22))
            Container(
                height: 25,
                margin: EdgeInsets.only(top: 45.0, left: 30.0),
                child: Text("Identify The Disease",
                    style: TextStyle(color: Colors.white70, fontSize: 22.0))),
            Container(
              height: 150,
              margin: EdgeInsets.only(top: 95.0, left: 30.0),
              child: Column(children: [
                Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/cough-min.png',
                      height: 90.0,
                      width: 90.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20.0, right: 15.0),
                      child: Column(children: [
                        Text("Cough",
                            style: TextStyle(
                                color: Colors.white70, fontSize: 22.0)),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text('For now, just stick to',
                            style: TextStyle(
                                color: Colors.white30, fontSize: 15.0)),
                        Text('the basics, Moorecroft says.',
                            style: TextStyle(
                                color: Colors.white30, fontSize: 15.0)),
                        Text(' The coronavirus is spread ',
                            style: TextStyle(
                                color: Colors.white30, fontSize: 15.0)),
                        Text('through respiratory vapour.',
                            style: TextStyle(
                                color: Colors.white30, fontSize: 15.0))
                      ]),
                    )
                  ],
                )
              ]),
            ),
            Container(
              height: 120.0,
              constraints: BoxConstraints.expand(width: 400.0, height: 200.0),
              // margin: new EdgeInsets.all(15),
              margin: new EdgeInsets.only(top: 230.0),
              child: Column(children: [
                Row(children: [
                  Container(
                      margin: new EdgeInsets.only(left: 30.0, top: 50.0),
                      child: Image.asset(
                        'assets/images/runny-nose-min.png',
                        height: 90.0,
                        width: 90.0,
                      )),
                  Container(
                    margin: new EdgeInsets.only(left: 20.0, top: 50.0),
                    child: Column(children: [
                      Text("Shortness of breath",
                          style:
                              TextStyle(color: Colors.white70, fontSize: 22.0)),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('For now, just stick to',
                          style:
                              TextStyle(color: Colors.white30, fontSize: 15.0)),
                      Text('the basics, Moorecroft says.',
                          style:
                              TextStyle(color: Colors.white30, fontSize: 15.0)),
                      Text(' The coronavirus is spread ',
                          style:
                              TextStyle(color: Colors.white30, fontSize: 15.0)),
                      Text('through respiratory vapour.',
                          style:
                              TextStyle(color: Colors.white30, fontSize: 15.0))
                    ]),
                  )
                ])
              ]),
              decoration: new BoxDecoration(
                color: new Color(0xFF1D2329),
                shape: BoxShape.rectangle,
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: new Offset(0.0, 10.0),
                  ),
                ],
              ),
            ),
            Container(
                height: 200,
                margin: EdgeInsets.only(top: 450.0, left: 30.0),
                child: Column(children: [
                  Row(children: [
                    Container(
                        margin: new EdgeInsets.only(left: 0.0, top: 35.0),
                        child: Image.asset(
                          'assets/images/fever-min.png',
                          height: 90.0,
                          width: 90.0,
                        )),
                    Container(
                      margin: new EdgeInsets.only(left: 25.0, top: 25.0),
                      child: Column(children: [
                        Text("Fever",
                            style: TextStyle(
                                color: Colors.white70, fontSize: 22.0)),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text('For now, just stick to',
                            style: TextStyle(
                                color: Colors.white30, fontSize: 15.0)),
                        Text('the basics, Moorecroft says.',
                            style: TextStyle(
                                color: Colors.white30, fontSize: 15.0)),
                        Text(' The coronavirus is spread ',
                            style: TextStyle(
                                color: Colors.white30, fontSize: 15.0)),
                        Text('through respiratory vapour.',
                            style: TextStyle(
                                color: Colors.white30, fontSize: 15.0))
                      ]),
                    )
                  ])
                ])),
          ],
        ),
      ),
    );
  }
}
