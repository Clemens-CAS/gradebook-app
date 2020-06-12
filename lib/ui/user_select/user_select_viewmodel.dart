import 'package:flutter/cupertino.dart';
import 'package:gradebook/core/services/service_locator.dart';
import 'package:gradebook/core/services/txconnect_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:txconnect/txconnect.dart';
import 'package:gradebook/router.dart';

class UserSelectViewModel extends BaseViewModel {
  var _context;

  TxConnectService _txService = locator<TxConnectService>();
  List<Student> _students;
  List<Student> get students => _students;

  void init(context) {
    _context = context;
  }

  Future<void> getStudents() async {
    _students = await _txService.getStudents();
    print(students);
  }

// TODO: User feedback on press. Switch student feedback
  Future<void> select(String studentId) async {
    await _txService.switchStudent(studentId: studentId);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('studentId', studentId);
    print(prefs.getString('studentId'));

    Navigator.pushNamedAndRemoveUntil(
        _context, TabsViewRoute, (route) => false);
  }
}
