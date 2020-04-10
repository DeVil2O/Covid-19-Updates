import 'package:flutter/material.dart';

class Prevention extends StatefulWidget {
  @override
  _PreventionState createState() => _PreventionState();
}

class _PreventionState extends State<Prevention> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF121517),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Container(
                height: 25,
                margin: EdgeInsets.only(top: 45.0, left: 30.0),
                child: Text(
                  "Stay Home, Stay Safe",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                )),
            Container(
              height: 110,
              margin: EdgeInsets.only(top: 45.0, left: 30.0),
              child: Column(children: [
                Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/hand-wash-min.png',
                      height: 90.0,
                      width: 90.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20.0, right: 15.0),
                      child: Column(children: [
                        Text("Wash Hands Frequently",
                            style: TextStyle(
                                color: Colors.white70, fontSize: 19.0)),
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
              constraints: BoxConstraints.expand(width: 400.0, height: 200.0),
              // margin: new EdgeInsets.all(15),
              margin: new EdgeInsets.only(top: 50.0),
              child: Column(children: [
                Row(children: [
                  Container(
                      margin: new EdgeInsets.only(left: 30.0, top: 50.0),
                      child: Image.asset(
                        'assets/images/mask-min.png',
                        height: 90.0,
                        width: 90.0,
                      )),
                  Container(
                    margin: new EdgeInsets.only(left: 20.0, top: 50.0),
                    child: Column(children: [
                      Text("Cover Your Cough",
                          style:
                              TextStyle(color: Colors.white70, fontSize: 19.0)),
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
                margin: EdgeInsets.only(top: 20.0, left: 30.0),
                child: Column(children: [
                  Row(children: [
                    Container(
                        margin: new EdgeInsets.only(left: 0.0, top: 35.0),
                        child: Image.asset(
                          'assets/images/touchnose-min.png',
                          height: 90.0,
                          width: 90.0,
                        )),
                    Container(
                      margin: new EdgeInsets.only(left: 25.0, top: 25.0),
                      child: Column(children: [
                        Text("Avoid Touching Face",
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
            Container(
              constraints: BoxConstraints.expand(width: 400.0, height: 200.0),
              // margin: new EdgeInsets.all(15),
              child: Column(children: [
                Row(children: [
                  Container(
                      margin: new EdgeInsets.only(left: 30.0, top: 50.0),
                      child: Image.asset(
                        'assets/images/distance-min.png',
                        height: 90.0,
                        width: 90.0,
                      )),
                  Container(
                    margin: new EdgeInsets.only(left: 10.0, top: 50.0),
                    child: Column(children: [
                      Text("Maintain Social Distancing",
                          style:
                              TextStyle(color: Colors.white70, fontSize: 19.0)),
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
          ],
        ),
      ),
    );
  }
}
