import 'dart:async';
import 'package:bookface/constants/images.dart';
import 'package:bookface/constants/strings.dart';
import 'package:bookface/routes/routes.dart';
import 'package:flutter/material.dart';

import 'helpers/connection.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    bottom: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          elevation: 15,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 90,
                            child: Image.asset(
                              Images.app_logo,
                              width: 120,
                              height: 120,
                            ),
                          ),
                        ),
                        Text(
                          Strings.app_name,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 50,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          Strings.tagline,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Images.light1),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 80,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Images.light2),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 50,
                    width: 100,
                    height: 150,
                    top: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Images.clock),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    width: 80,
                    height: 150,
                    bottom: 30,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Images.plant),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    width: 240,
                    height: 240,
                    bottom: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Images.bubble),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 27,
                    width: 200,
                    height: 450,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Images.lamp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _displayToast(String message) {
    /*
    This function will initialize a toast snakbar with the passed message String
    */

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  startTimer() async {
    var _duration = Duration(milliseconds: 5000);

    final bool connection = await isConnected();

    if (connection) // Connected To Internet
    {
      Timer(_duration, navigate);
    } else // Internet Connection Is Not Available
    {
      _displayToast("An Internet Connection Is Required.");
      //  Re-checks for internet availability again, after fixed _duration.
      Timer(_duration, startTimer);
    }
  }

  navigate() async {
    Navigator.of(context).pushNamed(Routes.login);
  }
}

/*Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: <Widget>[
Card(
elevation: 15,
shape: CircleBorder(),
child: CircleAvatar(
backgroundColor: Colors.white,
radius: 100,
child: Image.asset(
Images.app_logo,
width: 120,
height: 120,
),
),
),
Text(
Strings.app_name,
textDirection: TextDirection.ltr,
style: TextStyle(
fontSize: 50,
fontStyle: FontStyle.italic,
fontWeight: FontWeight.w300,
),
),
Text(
Strings.tagline,
textDirection: TextDirection.ltr,
style: TextStyle(
fontSize: 30,
fontStyle: FontStyle.italic,
fontWeight: FontWeight.w200,
),
),
],
),*/
