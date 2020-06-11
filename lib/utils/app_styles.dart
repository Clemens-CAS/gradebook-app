import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle pageTitle = TextStyle(
    fontSize: ScreenUtil().setSp(36.0),
    fontWeight: FontWeight.w600,
    color: AppColors.black,

  );

  static TextStyle pageCategories = TextStyle(
    fontSize: ScreenUtil().setSp(24.0),
    color: AppColors.black,
  );

  //Settings
  
}