import 'package:coronapp/country_detail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CountryDetails extends StatefulWidget {
  final CountryDetail countryDetail;
  final double width;
  final CountryDetail mainDetails;
  CountryDetails({this.countryDetail, this.width, this.mainDetails});

  @override
  _CountryDetailsState createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  int totalCases,
      activeCases,
      recoveredCases,
      criticalCases,
      todaysCases,
      todaysDeaths,
      deaths,
      deathsPerMill,
      casesPerMil;

  String mortalityRate, mortalityRateGlobal;

  double activeCasesColorWidth,
      recoveredCasesColorWidth,
      criticalCasesColorWidth;

  double screenWidth;

  @override
  void initState() {
    super.initState();

    screenWidth = widget.width;

    totalCases = int.parse(widget.countryDetail.cases);
    activeCases = int.parse(widget.countryDetail.active);
    recoveredCases = int.parse(widget.countryDetail.recovered);
    criticalCases = int.parse(widget.countryDetail.critical);
    todaysCases = int.parse(widget.countryDetail.todayCases);
    todaysDeaths = int.parse(widget.countryDetail.todayDeaths);
    deaths = int.parse(widget.countryDetail.deaths);
    if (widget.countryDetail.casesPerOneMillion != 'null') {
      casesPerMil = int.parse(
        double.parse(widget.countryDetail.casesPerOneMillion)
            .round()
            .toString(),
      );
    } else {
      casesPerMil = 0;
    }

    if (widget.countryDetail.deathsPerOneMillion != 'null') {
      deathsPerMill = int.parse(
        double.parse(widget.countryDetail.deathsPerOneMillion)
            .round()
            .toString(),
      );
    } else {
      deathsPerMill = 0;
    }

    var globalDeaths = widget.mainDetails.deaths;
    var globalCases = widget.mainDetails.cases;
    mortalityRate = (deaths / totalCases * 100).toStringAsFixed(1);
    int globalDeaths1 = int.parse(globalDeaths);
    int globalCases1 = int.parse(globalCases);

    mortalityRateGlobal =
        (globalDeaths1 / globalCases1 * 100).toStringAsFixed(1);
    double activePer = activeCases / totalCases * 100;
    double recoveredPer = recoveredCases / totalCases * 100;
    double criticalPer = criticalCases / totalCases * 100;
    activeCasesColorWidth = (screenWidth - 40.0) * (activePer / 100);
    recoveredCasesColorWidth = (screenWidth - 40.0) * (recoveredPer / 100);
    criticalCasesColorWidth = (screenWidth - 40.0) * (criticalPer / 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0f3360),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width,
            height: 100.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF42275a),
                  Color(0xFF734b6d),
                ],
              ),
              color: Colors.blue.shade600,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    BackButton(
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Text(
                        widget.countryDetail.country,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF193b67),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 60.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.globeAmericas,
                            size: 22.0,
                            color: Colors.blue.shade800,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Total Cases',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                        ],
                      ),
                      Text(
                        totalCases.toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.orangeAccent,
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.orangeAccent,
                                    ),
                                    width: 10.0,
                                    height: 10.0,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Active Cases',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontFamily: 'Ubuntu',
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                activeCases.toString(),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Stack(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width - 40.0,
                                height: 8.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.black26,
                                ),
                              ),
                              ActiveColorBar(
                                activeColor: Colors.orangeAccent,
                                bgColor: Colors.orangeAccent.withOpacity(0.5),
                                countryDetail: widget.countryDetail,
                                activeColorWidth: activeCasesColorWidth,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.pink.shade500,
                                    ),
                                    width: 10.0,
                                    height: 10.0,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Recovered Cases',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontFamily: 'Ubuntu',
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                recoveredCases.toString(),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Stack(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width - 40.0,
                                height: 8.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.black26,
                                ),
                              ),
                              ActiveColorBar(
                                activeColor: Colors.pink.shade500,
                                bgColor: Colors.white,
                                countryDetail: widget.countryDetail,
                                activeColorWidth: recoveredCasesColorWidth,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.lightBlueAccent,
                                    ),
                                    width: 10.0,
                                    height: 10.0,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Critical Cases',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontFamily: 'Ubuntu',
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                criticalCases.toString(),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Stack(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width - 40.0,
                                height: 8.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.black26,
                                ),
                              ),
                              ActiveColorBar(
                                activeColor: Colors.lightBlueAccent,
                                bgColor: Colors.white,
                                countryDetail: widget.countryDetail,
                                activeColorWidth: criticalCasesColorWidth,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
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
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Death\'s',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Today',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              todaysDeaths.toString(),
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.lightBlueAccent,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              deaths.toString(),
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.lightBlueAccent,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.lime.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Mortality Rate \n(approx)',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Global',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              '$mortalityRateGlobal%',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.lightBlueAccent,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              widget.countryDetail.country,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              '$mortalityRate%',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.lightBlueAccent,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Per One Million',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Cases',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              casesPerMil.toString(),
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.orangeAccent,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Death\'s',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              deathsPerMill.toString(),
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.lightBlueAccent,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActiveColorBar extends StatelessWidget {
  final CountryDetail countryDetail;
  final Color activeColor;
  final Color bgColor;
  final double activeColorWidth;
  ActiveColorBar({
    this.countryDetail,
    this.activeColor,
    this.activeColorWidth,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: activeColorWidth,
      height: 8.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: activeColor,
      ),
    );
  }
}
