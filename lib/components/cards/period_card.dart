import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradebook/utils/app_colors.dart';

class PeriodCard extends StatefulWidget {
  final String period;
  final String className;
  final String teacher;
  final int average;
  final GestureTapCallback onTap;
  PeriodCard(
      {Key key,
      this.period,
      this.className = '',
      this.teacher = '',
      this.average,
      this.onTap})
      : super(key: key);

  _PeriodCardState createState() => _PeriodCardState();
}

class _PeriodCardState extends State<PeriodCard> {
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
          color: _getGradeColor(widget.average),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  right: ScreenUtil().setWidth(15.0),
                ),
                child: Text(
                  widget.period != null ? widget.period : '',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36.0),
                    color: AppColors.lightGrey,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.className,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(24.0),
                            color: Color(0xFFF8FAFB),
                          ),
                        ),
                        Text(
                          widget.teacher,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(18.0),
                            color: Color(0xFFF8FAFB),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.average != null ? widget.average.toString() : '',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(36.0),
                        color: Color(0xFFF8FAFB),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getGradeColor(int grade) {
    if (grade == null) return AppColors.green;
    if (grade < 70) return AppColors.red;
    if (grade < 80) return AppColors.orange;
    if (grade < 90) return AppColors.yellow;
    return AppColors.green;
  }
}
