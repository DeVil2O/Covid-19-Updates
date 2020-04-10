import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' show Client;
import 'package:coronapp/country_detail.dart';
import 'package:shimmer/shimmer.dart';

class Mycards extends StatefulWidget {
  @override
  _MycardsState createState() => _MycardsState();
}

class _MycardsState extends State<Mycards> {
  Client client = Client();
  String cases, deaths, recovered, active, countCountries;
  int timestamp;
  String updatedOn;
  CountryDetail mainDetails;

  DateTime dateTime;

  Future _allCountriesFuture;
  List<CountryDetail> _allCountriesDetailsList;
  @override
  void initState() {
    super.initState();

    updatedOn = '--';
    _allCountriesFuture = getAllCountries();
  }

  refresh() async {
    setState(() {
      updatedOn = 'Refreshing';
      _allCountriesFuture = getAllCountries();
    });
  }

  Future getAllCountries() async {
    final response =
        await client.get('https://corona.lmao.ninja/countries?sort=cases');

    if (response.statusCode == 200) {
      List parsedJson = json.decode(response.body);

      print(parsedJson.length);

      List<CountryDetail> tempList = [];

      for (var res in parsedJson) {
        CountryDetail allCountriesDetails = CountryDetail(res);
        tempList.add(allCountriesDetails);
      }
      _allCountriesDetailsList = tempList;
    } else {
      throw Exception('Failed to get all countries names');
    }
    countCountries = _allCountriesDetailsList.length.toString();
    print(countCountries);

    mainDetails = _allCountriesDetailsList[20];
    cases = mainDetails.cases;
    deaths = mainDetails.deaths;
    recovered = mainDetails.recovered;
    active = mainDetails.active;
    timestamp = mainDetails.updated;

    dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    _allCountriesDetailsList.removeAt(0);

    return _allCountriesDetailsList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _allCountriesFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Shimmer.fromColors(
            period: Duration(milliseconds: 800),
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.black.withOpacity(0.5),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.15),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        width: 25.0,
                        height: 25.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 25.0,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 20.0,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        width: 25.0,
                        height: 25.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 25.0,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 20.0,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        width: 25.0,
                        height: 25.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 25.0,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 20.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          if (snapshot.data.length == 0) {
            return Center(
              child: Text(
                'No Countries Found',
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
            );
          }
          return Container(
            child: Column(children: <Widget>[
              Container(
                child: Column(children: [
                  Padding(padding: EdgeInsets.only(left: 115.0, top: 15.0)),
                  Text("Total Affected in India",
                      style:
                          TextStyle(color: Colors.greenAccent, fontSize: 20.0)),
                  SizedBox(height: 10.0),
                  Text(
                    cases,
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white60,
                      fontFamily: 'Ubuntu',
                    ),
                  )
                ]),
                constraints: BoxConstraints.expand(width: 350.0, height: 100.0),
                height: 100.0,
                margin: new EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                decoration: new BoxDecoration(
                  color: new Color(0xFF2c1f34),
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(8.0),
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
                child: Column(children: [
                  Column(children: [
                    Padding(padding: EdgeInsets.only(top: 15.0)),
                    Text("Total Deaths in India",
                        style: TextStyle(color: Colors.red, fontSize: 20.0)),
                    SizedBox(height: 10.0),
                    Row(children: [
                      Padding(padding: EdgeInsets.only(left: 60.0)),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green.withOpacity(0.15),
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.skullCrossbones,
                          color: Colors.lightBlueAccent.shade700,
                          size: 13.0,
                        ),
                        width: 25.0,
                        height: 25.0,
                      ),
                      SizedBox(width: 20.0),
                      Text(
                        deaths,
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60,
                          fontFamily: 'Ubuntu',
                        ),
                      )
                    ])
                  ])
                ]),
                height: 100.0,
                constraints: BoxConstraints.expand(width: 350.0, height: 100.0),
                // margin: new EdgeInsets.all(15),
                margin: new EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),

                decoration: new BoxDecoration(
                  color: new Color(0xFF2c1f34),
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(8.0),
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
                child: Column(children: [
                  Padding(padding: EdgeInsets.only(left: 115.0, top: 15.0)),
                  Text("Total Recovered in India",
                      style:
                          TextStyle(color: Colors.greenAccent, fontSize: 20.0)),
                  SizedBox(height: 10.0),
                  Text(
                    recovered,
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white60,
                      fontFamily: 'Ubuntu',
                    ),
                  )
                ]),
                height: 100.0,
                constraints: BoxConstraints.expand(width: 350.0, height: 100.0),
                // margin: new EdgeInsets.all(15),
                margin: new EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),

                decoration: new BoxDecoration(
                  color: new Color(0xFF2c1f34),
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(8.0),
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
                child: Column(children: [
                  Padding(padding: EdgeInsets.only(left: 115.0, top: 15.0)),
                  Text("Total Countries Affected",
                      style:
                          TextStyle(color: Colors.greenAccent, fontSize: 20.0)),
                  SizedBox(height: 10.0),
                  Text(
                    countCountries,
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white60,
                      fontFamily: 'Ubuntu',
                    ),
                  )
                ]),
                height: 100.0,
                constraints: BoxConstraints.expand(width: 350.0, height: 100.0),
                // margin: new EdgeInsets.all(15),
                margin: new EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),

                decoration: new BoxDecoration(
                  color: new Color(0xFF2c1f34),
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(8.0),
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: new Offset(0.0, 10.0),
                    ),
                  ],
                ),
              )
            ]),
          );
        }
      },
    );
  }
}
