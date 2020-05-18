import 'package:gradebook/models/grade.dart';

class Class{
  String period;
  String name;
  String teacher;
  String email;
  String average;
  String formativeAverage;
  String summativeAverage;

  List<Grade> formative;
  List<Grade> summative;

}