import 'package:gradebook/core/services/service_locator.dart';
import 'package:gradebook/core/services/txconnect_service.dart';
import 'package:stacked/stacked.dart';
import 'package:txconnect/txconnect.dart';

class GradesViewModel extends BaseViewModel {
  var _context;
  var _classrooms;
  List<Classroom> get classrooms => _classrooms;

  TxConnectService _txService = locator<TxConnectService>();

  void init(context) {
    _context = context;
  }

  Future<void> getClassrooms() async {
    _classrooms = await _txService.getClassrooms();
    print(_classrooms);
  }

  void openClassroom(String classId) {
    print(classId);
  }
}
