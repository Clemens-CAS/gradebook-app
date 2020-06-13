import 'package:gradebook/core/services/txconnect_service.dart';
import 'package:txconnect/txconnect.dart';

class TxConnectServiceLib extends TxConnectService {
  TxConnect tx = TxConnect();

  bool _isLoggedIn = false;
  bool _hasStudents = false;
  bool _hasClassrooms = false;
  bool _hasAlerts = false;
  bool get loggedIn => _isLoggedIn;

  @override
  Student getCurrentStudent() {
    return tx.currentStudent;
  }

  @override
  Future<bool> login({String username, String password}) async {
    _isLoggedIn = await tx.login(username, password);
    return _isLoggedIn;
  }

  @override
  Future<List<Student>> getStudents() async {
    if (!_isLoggedIn) throw Exception('Unsuccessful login');
    _hasStudents = true;
    return await tx.getStudents();
  }

  @override
  Future<Student> switchStudent({String studentId}) async {
    if (!_isLoggedIn) throw Exception('Unsuccessful Login');
    if (!_hasStudents)
      throw Exception(
          'Student List is undefined. Check if getStudents() has been called.');
    return await tx.switchStudent(studentId);
  }

  @override
  Future<List<Classroom>> getClassrooms() async {
    if (!_isLoggedIn) throw Exception('Unsuccessful Login');
    if (!_hasStudents)
      throw Exception(
          'Student List is undefined. Check if getStudents() has been called.');
    _hasClassrooms = true;
    return await tx.getClassrooms();
  }

  @override
  Future<Grades> getGrades({String classId}) async {
    if (!_isLoggedIn) throw Exception('Unsuccessful Login');
    if (!_hasStudents)
      throw Exception(
          'Student list is undefined. Check if getStudents() has been called.');
    if (!_hasClassrooms)
      throw Exception(
          'Classroom list is undefined. Check if getClassrooms() has been called.');
    return await tx.getGrades(classId);
  }

  @override
  Future<Attendance> getAttendance() async {
    if (!_isLoggedIn) throw Exception('Unsuccessful Login');
    if (!_hasStudents)
      throw Exception(
          'Student list is undefined. Check if getStudents() has been called.');
    if (!_hasClassrooms)
      throw Exception(
          'Classroom list is undefined. Check if getClassrooms() has been called.');
    return await tx.getAttendance();
  }

  @override
  Future<List<Alert>> getAlerts({bool getUnread}) async {
    if (!_isLoggedIn) throw Exception('Unsuccessful Login');
    if (!_hasStudents)
      throw Exception(
          'Student list is undefined. Check if getStudents() has been called.');
    _hasAlerts = true;
    return await tx.getAlerts(getUnread);
  }

  @override
  Future<void> readAlert({String alertId}) async {
    if (!_isLoggedIn) throw Exception('Unsuccessful Login');
    if (!_hasStudents)
      throw Exception(
          'Student list is undefined. Check if getStudents() has been called.');
    if (!_hasAlerts)
      throw Exception(
          'Alerts list is undefined. Check if getAlerts() has been called');
  }

  void logout() {
    //Clear current TxConnect
    tx = TxConnect();
  }
}
