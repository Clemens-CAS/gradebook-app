import 'package:flutter/cupertino.dart';
import 'package:gradebook/core/services/service_locator.dart';
import 'package:gradebook/core/services/txconnect_service.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  bool _incorrect = false;
  bool get incorrect => _incorrect;

  TxConnectService _txConnectService = locator<TxConnectService>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    print(
        'Username: ${usernameController.text}, Password: ${passwordController.text}');
    var success = await _txConnectService.login(
      username: usernameController.text,
      password: passwordController.text,
    );
    print(success);
    if (success) {
      print(await _txConnectService.getStudents());
      usernameController.dispose();
      passwordController.dispose();
    } else {
      _incorrect = true;
      logout();
    }
  }

  void logout() {
    _txConnectService.logout();
    print('Logged out of instance');
  }
}
