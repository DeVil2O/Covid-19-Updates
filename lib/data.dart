import 'package:coronapp/cards.dart';
import 'package:coronapp/routes.dart';
import 'package:flutter/material.dart';

final Color backgroundColor = Color(0xFF121517);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: Color(0xFF2c1534),
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
          // Positioned(
          //     child: Image.asset('assets/images/virus.jpg'),
          //     top: 435.0,
          //     right: 160.0)
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 130.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(children: <Widget>[
              Container(
                  child: Image.asset(
                'assets/images/virus-min.png',
                height: 150.0,
                width: 150.0,
              )),
              SizedBox(height: 30.0),
              Container(
                padding: EdgeInsets.only(right: 25.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isCollapsed)
                        _controller.forward();
                      else
                        _controller.reverse();

                      isCollapsed = !isCollapsed;
                    });
                  },
                  child: Text("Dashboard",
                      style: TextStyle(color: Colors.grey, fontSize: 22)),
                ),
              ),
              Routing(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.45 * screenWidth,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: Color(0xFF15071e),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: Icon(Icons.menu, color: Colors.white),
                        onTap: () {
                          setState(() {
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();

                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      SizedBox(width: 100.0),
                      Text("COVID",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.3)),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Image.asset('assets/images/poster.jpg'),
                  SizedBox(height: 20.0),
                  Container(
                    height: 500,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.9),
                      pageSnapping: true,
                      children: <Widget>[
                        Mycards(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
