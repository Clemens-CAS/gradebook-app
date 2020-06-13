import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradebook/ui/user_select/user_select_viewmodel.dart';
import 'package:gradebook/utils/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:txconnect/txconnect.dart';

class UserSelectView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 375.0,
      height: 812.0,
      allowFontScaling: true,
    );

    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.init(context),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.success,
        body: Padding(
          padding: EdgeInsets.only(
            left: 40.0.w,
            top: 100.0.h,
            bottom: 100.0.h,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            child: FutureBuilder(
              future: model.getStudents(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 30.0.h,
                      ),
                      Text(
                        'Who are you?',
                        style: TextStyle(
                          fontSize: 36.0.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 70.w,
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height - 400,
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView(
                              children: [
                                for (Student student in model.students)
                                  _studentCard(
                                    model,
                                    studentId: student.webId,
                                    name: student.name,
                                    id: student.id,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not here? ',
                            style: TextStyle(
                              fontSize: 18.0.sp,
                              fontWeight: FontWeight.w300,
                              color: AppColors.dark,
                            ),
                          ),
                          InkWell(
                            child: Text(
                              'Log out',
                              style: TextStyle(
                                fontSize: 18.0.sp,
                                fontWeight: FontWeight.w300,
                                color: AppColors.success,
                              ),
                            ),
                            onTap: () => model.logout(),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.success),
                    ),
                  );
                }
              },
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                topLeft: Radius.circular(30.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.dark.withOpacity(0.25),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, 4.h),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => UserSelectViewModel(),
    );
  }

  Widget _studentCard(model, {String studentId, String name, String id}) {
    return InkWell(
      onTap: () => model.select(studentId),
      child: Container(
        height: 78.h,
        padding: EdgeInsets.only(right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name.replaceAll(' ', '\u00A0'),
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 1,
              style: TextStyle(
                fontSize: 24.0.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              id,
              style: TextStyle(
                fontSize: 18.0.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: Create Better Loading Animation
