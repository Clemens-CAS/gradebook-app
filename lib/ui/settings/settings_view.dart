import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradebook/ui/components/gradebook_page.dart';
import 'package:gradebook/ui/settings/settings_viewmodel.dart';
import 'package:gradebook/utils/app_colors.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.init(context),
      builder: (context, model, child) => GradebookPage(
        title: 'Settings',
        children: [
          SizedBox(height: 12.h),
          _category(text: 'viewing'),
          _text(text: model.currentStudent),
          SizedBox(height: 15.h),
          _textButton(
            text: 'switch student',
            color: AppColors.medium,
            onTap: () => model.switchStudent(),
          ),
          SizedBox(height: 15.h),
          _textButton(
            text: 'log out',
            color: AppColors.danger,
            onTap: () => model.logout(),
          ),
          SizedBox(height: 50.h),
          _header(text: 'Help'),
          SizedBox(height: 10.h),
          _textButton(
            text: 'report bug',
            color: AppColors.danger,
            onTap: () => model.report(),
          ),
          SizedBox(height: 50.h),
          _header(text: 'About'),
          SizedBox(height: 12.h),
          _category(text: 'version'),
          _text(text: model.version),
          SizedBox(height: 12.h),
          _category(text: 'authors'),
          for (String name in model.authors) _text(text: name),
          SizedBox(height: 12.h),
          _category(text: 'contributors'),
          for (String name in model.contributors) _text(text: name),
        ],
      ),
      viewModelBuilder: () => SettingsViewModel(),
    );
  }

  Widget _header({@required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textColor,
      ),
    );
  }

  Widget _text({@required String text}) {
    return Text(
      text.replaceAll(' ', '\u00A0'),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        fontSize: 24.sp,
        color: AppColors.textColor,
      ),
    );
  }

  Widget _category({@required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18.sp,
        color: AppColors.medium,
      ),
    );
  }

  Widget _textButton(
      {@required String text, @required Color color, @required onTap}) {
    return InkWell(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24.0.sp,
          color: color,
        ),
      ),
      onTap: onTap,
    );
  }
}
