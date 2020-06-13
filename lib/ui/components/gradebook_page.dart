import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradebook/utils/app_colors.dart';
import 'package:gradebook/utils/app_styles.dart';

class GradebookPage extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final padding;

  const GradebookPage(
      {Key key, @required this.title, @required this.children, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 40.w,
              right: 40.w,
              top: 45.h,
            ),
            child: Text(
              this.title,
              style: AppStyles.pageTitle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: padding ?? 40.w,
              right: padding ?? 40.w,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: this.children,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
