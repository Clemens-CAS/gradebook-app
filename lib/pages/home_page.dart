import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradebook/utils/app_colors.dart';
import 'package:gradebook/components/cards/event_card.dart';
import 'package:gradebook/components/page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 375, height: 812, allowFontScaling: true)
          ..init(context);

    return Page(
      title: 'Home',
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(37.0),
              top: ScreenUtil().setHeight(45.0)),
          child: Text(
            'alerts',
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
            height: ScreenUtil().setHeight(240),
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
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(34.0),
            left: ScreenUtil().setWidth(37.0),
          ),
          child: Text(
            'new events',
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
            height: ScreenUtil().setHeight(240),
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
