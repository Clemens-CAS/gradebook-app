import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:gradebook/pages/attendance_page.dart';
import 'package:gradebook/pages/grades_page.dart';
import 'package:gradebook/pages/home_page.dart';
import 'package:gradebook/pages/settings_page.dart';
import 'package:gradebook/utils/gradebook_scroll_behavior.dart';
import 'fonts/cons_icons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await GlobalConfiguration().loadFromAsset('app_info');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: GradebookScrollBehavior(),
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: Container(
        color: Colors.white,
        // child: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: TabBarView(
              children: [
                HomePage(),
                AttendancePage(),
                GradesPage(),
                SettingsPage(),
              ],
            ),
            bottomNavigationBar: Container(
              color: Colors.white,
              child: TabBar(
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
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
      //),
    );
  }
}
