import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'home.dart';
import 'tabs/werkzeug_charts/werkzeug1.dart';
import 'tabs/werkzeug_charts/werkzeug2.dart';
import 'tabs/werkzeug_charts/werkzeug3.dart';
import 'tabs/werkzeug_charts/werkzeug4.dart';



var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => new HomeScreen(),
  "/werkzeug1" : (BuildContext context) => new Werkzeug1(),
  "/werkzeug2" : (BuildContext context) => new Werkzeug2(),
  "/werkzeug3" : (BuildContext context) => new Werkzeug3(),
  "/werkzeug4" : (BuildContext context) => new Werkzeug4(),
};

void main() => runApp(new MaterialApp(
    title: 'WERKZEUG 4.0',
    theme:
    new ThemeData(primaryColor:Colors.red,accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: new SplashScreen(),
    routes: routes ));
