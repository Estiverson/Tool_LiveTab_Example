import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:tabs/werkzeuge.dart' as _firstTab;
import 'tabs/live_chart.dart' as _secondTab;
import 'package:tabs/einstellungen.dart' as _thirdTab;
import 'screens/about.dart' as _aboutPage;
import 'screens/support.dart' as _supportPage;
import 'tabs/werkzeug_charts/werkzeug1.dart' as _werkzeug1Page;
import 'tabs/werkzeug_charts/werkzeug2.dart' as _werkzeug2Page;
import 'tabs/werkzeug_charts/werkzeug3.dart' as _werkzeug3Page;
import 'tabs/werkzeug_charts/werkzeug4.dart' as _werkzeug4Page;


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
return new MaterialApp(
    theme: new ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.red, backgroundColor: Colors.white
    ),
    home: new Tabs(),
    onGenerateRoute:
        (RouteSettings settings) {
      switch (settings.name) {
        case '/about':
          return new FromRightToLeft(
            builder: (_) => new _aboutPage.About(),
            settings: settings,
          );
        case '/support':
          return new FromRightToLeft(
            builder: (_) => new _supportPage.Support(),
            settings: settings,
          );
        case '/werkzeug1':
          return new FromRightToLeft(
            builder: (_) => new _werkzeug1Page.Werkzeug1(),
            settings: settings,
          );
        case '/werkzeug2':
          return new FromRightToLeft(
            builder: (_) => new _werkzeug2Page.Werkzeug2(),
            settings: settings,
          );
        case '/werkzeug3':
          return new FromRightToLeft(
            builder: (_) => new _werkzeug3Page.Werkzeug3(),
            settings: settings,
          );
        case '/werkzeug4':
          return new FromRightToLeft(
            builder: (_) => new _werkzeug4Page.Werkzeug4(),
            settings: settings,
          );
      }
    }
    );
  }
}

class FromRightToLeft<T> extends MaterialPageRoute<T> {
  FromRightToLeft({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {

    if (settings.isInitialRoute)
      return child;
    return new SlideTransition(
      child: new Container(
        decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.black26,
                blurRadius: 25.0,
              )
            ]
        ),
        child: child,
      ),
      position: new Tween(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0,0.0),
      ).animate(
          new CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          )
      ),
    );
  }
  @override Duration get transitionDuration => const Duration(milliseconds: 400);
}

class Tabs extends StatefulWidget {
  @override
  TabsState createState() => new TabsState();
}
class TabsState extends State<Tabs> {
  PageController _tabController;
  var _title_app = null;
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new PageController();
    this._title_app = TabItems[0].title;
  }

  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build (BuildContext context) => new Scaffold(
    //App Bar
      appBar: new AppBar(
        title: new Text(
          _title_app,
          style: new TextStyle(
            fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
          ),
        ),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      //Content of tabs
      body: new PageView(
        controller: _tabController,
        onPageChanged: onTabChanged,
        children: <Widget>[
          new _firstTab.Werkzeuge(),
          new _secondTab.SimpleSeriesLegend.withSampleData(),
          new _thirdTab.Einstellungen(),
        ],
      ),
      //Tabs
      bottomNavigationBar: Theme.of(context).platform == TargetPlatform.iOS ?
      new CupertinoTabBar(
        activeColor: Colors.red,
        currentIndex: _tab,
        onTap: onTap,
        items: TabItems.map((TabItem) {
          return new BottomNavigationBarItem(
            title: new Text(TabItem.title),
            icon: new Icon(TabItem.icon),
          );
        }).toList(),
      ):
      new BottomNavigationBar(
        currentIndex: _tab,
        onTap: onTap,
        items: TabItems.map((TabItem) {
          return new BottomNavigationBarItem(
            title: new Text(TabItem.title),
            icon: new Icon(TabItem.icon),
          );
        }).toList(),
      ),
      //Drawer
      drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new Container(
                height: 120.0,
                child: new DrawerHeader(
                  padding: new EdgeInsets.all(0.0),
                  decoration: new BoxDecoration(
                    color: new Color(0xFFECEFF1),
                  ),
                  child: new Image.asset('Images/Aventec_zerspantechnik.png',fit:BoxFit.fill,),
                ),
              ),
              new ListTile(
                  leading: new Icon(Icons.chat),
                  title: new Text('Support'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/support');
                  }
              ),
              new ListTile(
                  leading: new Icon(Icons.info),
                  title: new Text('Information'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/about');
                  }
              ),
              new Divider(),
              new ListTile(
                  leading: new Icon(Icons.search),
                  title: new Text('Suchen'),
                  onTap: () {
                    Navigator.pop(context);
                  }
              ),
            ],
          )
      )
  );
  void onTap(int tab){
    _tabController.jumpToPage(tab);
  }
  void onTabChanged(int tab) {
    setState((){
      this._tab = tab;
    });
    switch (tab) {
      case 0:
        this._title_app = TabItems[0].title;
        break;
      case 1:
        this._title_app = TabItems[1].title;
        break;
      case 2:
        this._title_app = TabItems[2].title;
        break;
    }
  }
}
class TabItem {
  const TabItem({ this.title, this.icon });
  final String title;
  final IconData icon;
}
const List<TabItem> TabItems = const <TabItem>[
  const TabItem(title: 'Werkzeugübersicht', icon: Icons.settings_applications),
  const TabItem(title: 'Live', icon: Icons.poll),
  const TabItem(title: 'Einstellungen', icon: Icons.settings)
];
