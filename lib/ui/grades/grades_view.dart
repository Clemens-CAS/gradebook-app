import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradebook/ui/components/gradebook_page.dart';
import 'package:gradebook/ui/grades/grades_viewmodel.dart';
import 'package:gradebook/utils/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:txconnect/txconnect.dart';

class GradesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onModelReady: (model) => model.init(context),
        builder: (context, model, child) => GradebookPage(
              title: 'Grades',
              padding: 25.w,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 150.h,
                  child: FutureBuilder(
                    future: model.getClassrooms(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView(
                          children: [
                            for (var classroom in model.classrooms)
                              _classroomCard(model, classroom),
                          ],
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
        viewModelBuilder: () => GradesViewModel());
  }

  Widget _classroomCard(model, Classroom classroom) {
    var color = AppColors.goodGrade;
    var grade = double.tryParse(classroom.totalAverage);
    if (grade != null) {
      if (grade < 70) {
        color = AppColors.failingGrade;
      } else if (grade < 80) {
        color = AppColors.lowGrade;
      } else if (grade < 90) {
        color = AppColors.averageGrade;
      }
    }

    return Padding(
      padding: EdgeInsets.only(
        bottom: 10.0.h,
      ),
      child: InkWell(
        onTap: () => model.openClassroom(classroom.classId),
        child: Container(
          height: 70.0.h,
          child: Padding(
            padding: EdgeInsets.only(
              left: 15.0.w,
              right: 15.0.w,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        classroom.period,
                        style: TextStyle(
                          fontSize: 36.sp,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              classroom.name.replaceAll(' ', '\u00A0'),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 24.0.sp,
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              classroom.teacher
                                  .toLowerCase()
                                  .replaceAll(' ', '\u00A0'),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 18.0.sp,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  classroom.totalAverage,
                  style: TextStyle(
                    fontSize: 36.sp,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
