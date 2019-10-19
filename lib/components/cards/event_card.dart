import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String info;
  final Color color;
  final GestureTapCallback onTap;
  EventCard(
      {Key key, this.title = '', this.subtitle = '', this.info = '', this.color, this.onTap})
      : super(key: key);

  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 375,
      height: 812,
      allowFontScaling: true,
    )..init(context);

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10.0)),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(14.0),
            right: ScreenUtil().setWidth(14.0),
            top: ScreenUtil().setHeight(10.0),
            bottom: ScreenUtil().setHeight(11.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(24.0),
                      color: Color(0xFFF8FAFB),
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(18.0),
                      color: Color(0xFFF8FAFB),
                    ),
                  ),
                ],
              ),
              Text(
                    widget.info,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(24.0),
                      color: Color(0xFFF8FAFB),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
