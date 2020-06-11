import 'package:gradebook/core/services/service_locator.dart';
import 'package:gradebook/core/services/txconnect_service.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  String _username;
  String _password;

  TxConnectService _txConnectService = locator<TxConnectService>();

  void username(String username) {
    _username = username;
  }

  void password(String password) {
    _password = password;
  }

  Future<void> login() async {
    print('Username: $_username, Password: $_password');
    var good =
        await _txConnectService.login(username: _username, password: _password);
    print(good);
    if (good) print(await _txConnectService.getStudents());
  }

  void logout() {
    _txConnectService.logout();
    print('Logged out of instance');
  }
}

// //Exception has occurred.
// NoSuchMethodError (NoSuchMethodError: The getter 'attributes' was called on null.
// Receiver: null
// Tried calling: attributes)

//Second time failed?
