import 'package:gradebook/core/services/service_locator.dart';
import 'package:gradebook/core/services/txconnect_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:txconnect/txconnect.dart';

class UserSelectViewModel extends BaseViewModel {
  TxConnectService _txService = locator<TxConnectService>();
  List<Student> _students;
  List<Student> get students => _students;

  Future<void> getStudents() async {
    _students = await _txService.getStudents();
    print(students);
  }

  Future<void> select(String studentId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('studentId', studentId);
    print(prefs.getString('studentId'));
  }
}

//[Student{WEB_ID: 00, ID: 061780, NAME: ADAM J. UMAR}, Student{WEB_ID: 01, ID: 061698, NAME: ZACKARYA UMAR}]
