import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradebook/components/calendar/calendar.dart';
import 'package:gradebook/components/cards/event_card.dart';
import 'package:gradebook/components/page.dart';
import 'package:gradebook/utils/app_colors.dart';

class AttendancePage extends StatefulWidget {
  AttendancePage({Key key}) : super(key: key);

  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 375,
      height: 812,
      allowFontScaling: true,
    )..init(context);

    return Page(
      title: 'Attendance',
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(40.0),
          ),
          child: Calendar(
            startDate: DateTime.now(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(34.0),
            left: ScreenUtil().setWidth(37.0),
          ),
          child: Text(
            'upcoming events',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(24.0),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(37.0),
              top: ScreenUtil().setHeight(10.0),
              right: ScreenUtil().setWidth(37.0)),
          child: Container(
            height: ScreenUtil().setHeight(300.0),
            child: ListView(
              children: <Widget>[
                EventCard(
                  title: 'TITLE',
                  subtitle: 'subtitle',
                  info: '100',
                  color: AppColors.green,
                  onTap: () {},
                ),
                EventCard(
                  title: 'TITLE',
                  subtitle: 'subtitle',
                  info: '100',
                  color: AppColors.red,
                  onTap: () {},
                ),
                EventCard(
                  title: 'TITLE',
                  subtitle: 'subtitle',
                  info: '100',
                  color: AppColors.green,
                  onTap: () {},
                ),
                EventCard(
                  title: 'TITLE',
                  subtitle: 'subtitle',
                  info: '100',
                  color: AppColors.red,
                  onTap: () {},
                ),
                EventCard(
                  title: 'TITLE',
                  subtitle: 'subtitle',
                  info: '100',
                  color: AppColors.green,
                  onTap: () {},
                ),
                EventCard(
                  title: 'TITLE',
                  subtitle: 'subtitle',
                  info: '100',
                  color: AppColors.red,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
