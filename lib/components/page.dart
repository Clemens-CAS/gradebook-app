import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      allowFontScaling: true,
    )..init(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(40.0),
                top: ScreenUtil().setHeight(45.0)),
            child: Text(
              this.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: ScreenUtil().setSp(36.0),
              ),
            ),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: this.children),
        ],
      ),
    );
  }
}
