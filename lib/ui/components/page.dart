import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradebook/utils/app_styles.dart';

class Page extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const Page({Key key, @required this.title, @required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 40.w,
          right: 40.w,
          top: 45.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              this.title,
              style: AppStyles.pageTitle,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: this.children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
