import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradebook/components/page.dart';
import 'fonts/cons_icons.dart';

void main() =>
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((a) {
      runApp(MyApp());
    });

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.white,
       // child: SafeArea(
          child: DefaultTabController(
            length: 4,
            child: Scaffold(
              body: TabBarView(
                children: [
                  Page(
                    title: 'Home',
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                      )
                    ],
                  ),
                  Page(
                    title: 'Attendance',
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                      )
                    ],
                  ),
                  Page(
                    title: 'Grades',
                    children: <Widget>[],
                  ),
                  Page(
                    title: 'Settings',
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                      )
                    ],
                  ),
                ],
              ),
              bottomNavigationBar: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Cons.home,
                      size: 35.0,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Cons.calendar,
                      size: 35.0,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Cons.clipboard,
                      size: 35.0,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Cons.cog,
                      size: 35.0,
                    ),
                  ),
                ],
                labelColor: Color(0xff39D8A9),
                unselectedLabelColor: Color(0xffB8B8B8),
                indicatorColor: Colors.transparent,
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),
      //),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(),
    );
  }
}
