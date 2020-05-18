import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradebook/components/calendar/day_button.dart';
import 'package:gradebook/utils/app_colors.dart';
import 'dart:core';

import 'package:gradebook/utils/calendar_utils.dart';

class Calendar extends StatefulWidget {
  final DateTime startDate;
  Calendar({
    Key key,
    @required this.startDate,
  }) : super(key: key);

  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  TextStyle dayStyle = TextStyle(
    fontSize: ScreenUtil().setSp(18.0),
  );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 375,
      height: 812,
      allowFontScaling: true,
    )..init(context);
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(40.0),
          right: ScreenUtil().setWidth(40.0),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: CalendarUtils.months[widget.startDate.month - 1],
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(36.0),
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: " ${widget.startDate.year}",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(18.0),
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            buildCurrentCalendar(widget.startDate),
          ],
        ),
      ),
    );
  }

  Row buildCurrentCalendar(DateTime date) {
    CalendarUtils cal = CalendarUtils();
    List<int> calendarNums = cal.calendarDays(date.year, date.month);
    List<Column> cols = new List<Column>();

    for (int i = 0; i < 7; i++) {
      List<Widget> widgets = new List<Widget>();
      widgets.add(
        Text(
          CalendarUtils.weekdays[i],
          style: dayStyle,
          textAlign: TextAlign.center,
        ),
      );
      widgets.add(
        SizedBox(
          height: ScreenUtil().setHeight(10.0),
        ),
      );
      for (int j = 0; j < 5; j++) {
        widgets.add(
          SizedBox(
            height: ScreenUtil().setHeight(10.0),
          ),
        );

        int index = j * 7 + i;

        widgets.add(
          /*Text(
            calendarNums[j * (7) + i].toString(),
            style: TextStyle(
              fontSize: ScreenUtil().setSp(18.0),
              fontWeight: FontWeight.w300,
              color: (((j * 7 + i) < cal.priorDays) ||
                      (((j * 7 + i) > 34 - cal.postDays)))
                  ? AppColors.darkGrey
                  : Colors.black,
            ),
            textAlign: TextAlign.center,
          ),*/
          DayButton(
            day: calendarNums[index],
            textColor: (index < cal.priorDays) || (index > 34 - cal.postDays) ? AppColors.darkGrey : Colors.black,
          )
        );
      }
      cols.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widgets,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: cols,
    );
  }
}
