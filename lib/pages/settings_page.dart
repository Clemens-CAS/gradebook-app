import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:gradebook/utils/app_colors.dart';
import 'package:gradebook/components/page.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  final String currentStudent;
  final String version = GlobalConfiguration().getString('version');
  final List authors = GlobalConfiguration().get('authors');
  final List contributers = GlobalConfiguration().get('contributors');

  SettingsPage({
    Key key,
    this.currentStudent = 'JOHN D. DOE',
  }) : super(key: key);

  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 375,
      height: 812,
      allowFontScaling: true,
    )..init(context);

    return Page(
      title: 'Settings',
      children: <Widget>[
        _category(
          title: 'viewing',
          text: [widget.currentStudent],
        ),
        _button(
          text: 'switch student',
          color: AppColors.darkGrey,
          onTap: (){
            print("Switch student says 'boop'");
          }
        ),
        _button(
          text: 'log out',
          color: AppColors.red,
          onTap: (){
            print("Log out says 'boop'");
          }
        ),
        _header(
          title: 'Help'
        ),
        _button(
          text: 'report bug',
          color: AppColors.red,
          onTap: (){
            print("Report bug says 'boop'");
            _report();
          }
        ),
        _header(
          title: 'About'
        ),
        _category(
          title: 'version',
          text: [widget.version],
        ),
        _category(
          title: (widget.authors.length == 1) ? 'author' : 'authors',
          text: widget.authors,
        ),
        _category(
          title: 'contibutors',
          text: widget.contributers,
        ),
      ],
    );
  }

  Widget _header({@required String title}){
    return Padding(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(40.0),
            top: ScreenUtil().setHeight(51.0),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(36.0),
              fontWeight: FontWeight.w600,
            ),
          ),
        );
  }

  Widget _category({@required String title, @required List text}) {
    List<Widget> children = <Widget>[];

    children.add(
      Padding(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(40.0),
          top: ScreenUtil().setHeight(12.0),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(18.0),
            color: AppColors.darkGrey,
          ),
        ),
      ),
    );
    for (String string in text) {
      children.add(
        Padding(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(40.0),
          ),
          child: Text(
            string,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(24.0),
            ),
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  Widget _button({@required String text, Color color = AppColors.red, GestureTapCallback onTap}) {
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(40.0),
        top: ScreenUtil().setHeight(15.0),
      ),
      child: GestureDetector(
        child: Text(
          text,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(24.0),
            color: color,
          ),
        ),
        onTap: onTap
      ),
    );
  }

  _report() async {
    final url = GlobalConfiguration().getString('bugReportUrl');

    Fluttertoast.showToast(
        msg: 'Your message has been successfully ignored and forgotten.',
        gravity: ToastGravity.BOTTOM);
    await Future.delayed(const Duration(seconds: 2));
    if (await canLaunch(url))
      await launch(url);
    else
      throw 'Could not launch $url';
  }
}
