import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradebook/components/event_card.dart';

class Page extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const Page({Key key, @required this.title, @required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(
      width: 375,
      height: 812,
      allowFontScaling: true
    )..init(context);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(40.0), top: ScreenUtil().setHeight(45.0)),
                child: Text(
                  'Home',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil().setSp(36.0),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(40.0), top: ScreenUtil().setHeight(45.0)),
                child: Text(
                  'alerts',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: ScreenUtil().setSp(24.0),
                  ),
                ),
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(40.0), top: ScreenUtil().setHeight(10.0), right: ScreenUtil().setWidth(40.0)),
              child: Container(
                height: ScreenUtil().setHeight(240),
                child: ListView(
                  children: <Widget>[
                    EventCard(
                      title: 'AP ENG 4',
                      subtitle: '56 on assignment',
                      color: Color(0xffFF8787),
                    ),
                    EventCard(
                      title: 'SCHOOL RELATED',
                      subtitle: 'oct 2',
                      color: Color(0xff39D8A9),
                    ),
                    EventCard(
                      title: 'AP ENG 4',
                      subtitle: '56 on assignment',
                      color: Color(0xffFF8787),
                    ),
                    EventCard(
                      title: 'SCHOOL RELATED',
                      subtitle: 'oct 2',
                      color: Color(0xff39D8A9),
                    ),
                    EventCard(
                      title: 'AP ENG 4',
                      subtitle: '56 on assignment',
                      color: Color(0xffFF8787),
                    ),
                    EventCard(
                      title: 'SCHOOL RELATED',
                      subtitle: 'oct 2',
                      color: Color(0xff39D8A9),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
