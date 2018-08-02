import 'package:flutter/material.dart';


class Werkzeug2 extends StatefulWidget {
  @override
  _Werkzeug2State createState() => new _Werkzeug2State();
}

class _Werkzeug2State extends State<Werkzeug2> {
  List _fruits = ["Variable 1", "Variable 2", "Variable 3", "Variable 4", "Variable 5"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedFruit;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_fruits);
    _selectedFruit = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
    List<DropdownMenuItem<String>> items = new List();
    for (String fruit in fruits) {
      items.add(new DropdownMenuItem(value: fruit, child: new Text(fruit)));
    }
    return items;
  }

  void changedDropDownItem(String selectedFruit) {
    setState(() {
      _selectedFruit = selectedFruit;
    });
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: new AppBar(
      title: new Text("Werkzeug 2",
        style: new TextStyle(
          fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
        ),
      ),
      elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
    ),
    body: new PageView(
      children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text("Please choose a variable for tool2: "),
            new DropdownButton(
              value: _selectedFruit,
              items: _dropDownMenuItems,
              onChanged: changedDropDownItem,
            )
          ],
        )
      ],
    ),
  );
}
