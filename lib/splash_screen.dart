import 'package:flutter/material.dart';
import 'dart:async';

import 'utils/my_navigator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Timer(
        new Duration(seconds: 5),() => MyNavigator.goToHomeScreen(context)
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(color: Colors.red),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(flex: 2,
                child: new Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Padding(padding: new EdgeInsets.only(top: 10.0),
                      ),
                      new Image.asset ('Images/fraeser_FCi_icon2.png',fit:BoxFit.fill,),
                      new Text ("WERKZEUG 4.0",style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0),),
                    ],
                  ),
                ),
              ),
              new Expanded(
                flex: 1,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new CircularProgressIndicator(),
                    new Padding (
                        padding: new  EdgeInsets.only(top: 20.0)
                    ),
                    new Text( "© AVANTEC Zerspantechnik",
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize:18.0,
                          fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
