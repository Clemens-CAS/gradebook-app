import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradebook/utils/app_colors.dart';
import 'package:gradebook/utils/app_styles.dart';

class GradebookPage extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const GradebookPage({Key key, @required this.title, @required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
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
