import 'package:gradebook/core/services/txconnect_service.dart';
import 'package:txconnect/txconnect.dart';

class TxConnectServiceMock extends TxConnectService {
  @override
  Student getCurrentStudent() {
    return Student('00', '000001', 'JOHN D. DOE');
  }

  @override
  Future<List<Alert>> getAlerts({bool getUnread}) {
    throw UnimplementedError();
  }

  @override
  Future<Attendance> getAttendance() {
    throw UnimplementedError();
  }

  @override
  Future<List<Classroom>> getClassrooms() {
    throw UnimplementedError();
  }

  @override
  Future<Grades> getGrades({String classId}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Student>> getStudents() async {
    return await Future.delayed(Duration(seconds: 2)).then((value) {
      return Future.value([
        Student('00', '000001', 'JOHN D. DOE'),
        Student('01', '000002', 'JOSHUA D. DOE'),
        Student('02', '000003', 'JEFFERY D. DOE'),
        Student('03', '000004', 'JENNIFER L. DOE'),
        Student('04', '000005', 'ZACKARYA LONG UMAR'),
        Student('04', '000005', 'ZACKARYA LONG UMAR'),
        Student('04', '000005', 'ZACKARYA LONG UMAR'),
        Student('04', '000005', 'ZACKARYA LONG UMAR'),
        Student('04', '000005', 'ZACKARYA LONG UMAR'),
        Student('04', '000005', 'ZACKARYA LONG UMAR')
      ]);
    });
  }

  @override
  Future<bool> login({String username, String password}) async {
    if (username.trim().isEmpty) return Future.value(false);
    return Future.value(true);
  }

  @override
  void logout() {}

  @override
  Future<void> readAlert({String alertId}) {
    throw UnimplementedError();
  }

  @override
  Future<Student> switchStudent({String studentId}) {
    return Future.value(Student('00', '000001', 'JOHN D. DOE'));
  }
}
