import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradebook/components/cards/period_card.dart';
import 'package:gradebook/components/page.dart';

class GradesPage extends StatefulWidget {
  GradesPage({Key key}) : super(key: key);

  _GradesPageState createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 375,
      height: 812,
      allowFontScaling: true,
    )..init(context);

    return Page(
      title: 'Grades',
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(37.0),
            top: ScreenUtil().setHeight(22.0),
            right: ScreenUtil().setWidth(37.0),
          ),
          child: Container(
            height: ScreenUtil().setHeight(660.0),
            child: ListView(
              children: <Widget>[
                PeriodCard(
                  period: '1',
                  className: 'OFF CAMPUS',
                  teacher: 'staff',
                ),
                PeriodCard(
                  period: '2',
                  className: 'AP CALC BC',
                  teacher: 'david sassman',
                  average: 93,
                ),
                PeriodCard(
                  period: '3',
                  className: 'IB END 4 HL 2',
                  teacher: 'veronica riordan',
                  average: 72,
                ),
                PeriodCard(
                  period: '4',
                  className: 'IB SPAN 4 SL 1',
                  teacher: 'eric hecox',
                  average: 80,
                ),
                PeriodCard(
                  period: '5',
                  className: 'LUNCH',
                  teacher: 'staff',
                ),
                PeriodCard(
                  period: '6',
                  className: 'IB PHYSICS...',
                  teacher: 'micheal t. mary',
                  average: 33,
                ),
                PeriodCard(
                  period: '7',
                  className: 'IB HIS HL 2',
                  teacher: 'shawn johnson',
                  average: 95,
                ),
                PeriodCard(
                  period: '8',
                  className: 'TOK - SENIOR',
                  teacher: 'kristen mumme',
                  average: 99,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
