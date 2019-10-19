import 'package:flutter/material.dart';
import 'package:gradebook/components/page.dart';

class AttendancePage extends StatefulWidget {
  AttendancePage({Key key}) : super(key: key);

  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Page(
      title: 'Attendance',
      children: <Widget>[],
    );
  }
}