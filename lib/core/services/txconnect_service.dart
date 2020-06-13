import 'package:flutter/foundation.dart';
import 'package:txconnect/txconnect.dart';

abstract class TxConnectService {
  Future<bool> login({@required String username, @required String password});
  void logout();

  Student getCurrentStudent();

  Future<List<Student>> getStudents();
  Future<Student> switchStudent({@required String studentId});

  Future<List<Classroom>> getClassrooms();
  Future<Grades> getGrades({@required String classId});

  Future<Attendance> getAttendance();

  Future<List<Alert>> getAlerts({@required bool getUnread});
  Future<void> readAlert({@required String alertId});
}
