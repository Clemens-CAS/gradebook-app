import 'package:flutter/cupertino.dart';
import 'package:gradebook/core/services/service_locator.dart';
import 'package:gradebook/core/services/txconnect_service.dart';
import 'package:gradebook/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginViewModel extends BaseViewModel {
  var _context;

  final _signUpUrl = 'https://txconnpa.esc13.net/PACB/Registration.aspx';
  final _fogotPasswordUrl =
      'https://txconnpa.esc13.net/PACB/ForgotPassword.aspx';

  bool _obscurePassword = true;

  bool _incorrect = false;
  bool _attempting = false;

  bool get obscurePassword => _obscurePassword;
  bool get incorrect => _incorrect;
  bool get attempting => _attempting;

  TxConnectService _txService = locator<TxConnectService>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void init(context) {
    _context = context;
  }

  Future<void> login() async {
    if (_attempting) return;
    print(
        'Username: ${usernameController.text.trim()}, Password: ${passwordController.text.trim()}');

    _attempting = true;
    notifyListeners();

    var success = await _txService.login(
      username: usernameController.text.trim(),
      password: passwordController.text.trim(),
    );

    print(success);

    if (success) {
      var prefs = await SharedPreferences.getInstance();
      prefs.setString('username', usernameController.text);
      prefs.setString('password', usernameController.text);
      Navigator.pushNamedAndRemoveUntil(
          _context, UserSelectViewRoute, (route) => false);
    } else {
      _incorrect = true;
      _attempting = false;
      logout();
      notifyListeners();
    }
  }

  Future<void> signUp() async {
    if (await canLaunch(_signUpUrl)) {
      await launch(_signUpUrl);
    } else {
      throw 'Could not launch $_signUpUrl';
    }
  }

  Future<void> forgotPassword() async {
    if (await canLaunch(_fogotPasswordUrl)) {
      await launch(_fogotPasswordUrl);
    } else {
      throw 'Could not launch $_fogotPasswordUrl';
    }
  }

  void logout() {
    _txService.logout();
    print('Logged out of instance');
  }

  void togglePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }
}
