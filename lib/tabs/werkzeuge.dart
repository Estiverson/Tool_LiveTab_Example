import 'package:flutter/material.dart';

class Werkzeuge extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container (
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
            onPressed:(){
              Navigator.of(context).pushNamed("/werkzeug1");
            },
            child: new Text("WERKZEUG 1"),
          ),
              new RaisedButton(
                onPressed:(){
                  Navigator.of(context).pushNamed("/werkzeug2");
                },
                child: new Text("WERKZEUG 2"),
              ),
              new RaisedButton(
                onPressed:(){
                  Navigator.of(context).pushNamed("/werkzeug3");
                },
                child: new Text("WERKZEUG 3"),
              ),
              new RaisedButton(
                onPressed:(){
                  Navigator.of(context).pushNamed("/werkzeug4");
                },
                child: new Text("WERKZEUG 4"),
              ),
            ],
        )
    );
  }







