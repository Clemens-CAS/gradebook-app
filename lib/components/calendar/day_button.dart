import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradebook/utils/app_colors.dart';

class DayButton extends StatefulWidget {
  final int day;
  final Color textColor;
  final Color circleColor;
  DayButton(
      {Key key,
      @required this.day,
      this.textColor = Colors.black,
      this.circleColor = Colors.transparent})
      : super(key: key);

  @override
  _DayButtonState createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 375,
      height: 812,
      allowFontScaling: true,
    )..init(context);
    return GestureDetector(
      onTap: () {
        print("Day ${widget.day} said BOOP");
      },
      child: Container(
        width: ScreenUtil().setWidth(27.0),
        height: ScreenUtil().setHeight(27.0),
        decoration: BoxDecoration(
          color: widget.circleColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            widget.day.toString(),
            style: TextStyle(
              fontSize: ScreenUtil().setSp(18.0),
              fontWeight: FontWeight.w300,
              color: widget.circleColor == Colors.transparent
                  ? widget.textColor
                  : AppColors.lightGrey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
