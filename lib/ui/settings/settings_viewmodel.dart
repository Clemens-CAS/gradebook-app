import 'package:flutter/cupertino.dart';
import 'package:gradebook/core/services/service_locator.dart';
import 'package:gradebook/core/services/txconnect_service.dart';
import 'package:gradebook/router.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsViewModel extends BaseViewModel {
  var _context;
  var _txService = locator<TxConnectService>();

  var _authors = [
    'Zackarya Umar',
  ];
  var _contributors = [
    'Hubert Ranger',
    'Jared Machado',
    'Will Staton',
    'Ian Crowley',
  ];

  var _bugReportUrl =
      'https://www.github.com/Clemens-CAS/gradebook-app/issues/new';

  String get currentStudent => _txService.getCurrentStudent().name;
  String get version => '1.0.0';

  List<String> get authors => _authors;
  List<String> get contributors => _contributors;

  void init(context) {
    _context = context;
  }

  void switchStudent() {
    print('Switch Student');
    Navigator.pushNamed(_context, UserSelectViewRoute);
  }

  void logout() {
    print('Log out');
    _txService.logout();
    Navigator.pushNamedAndRemoveUntil(
        _context, LoginViewRoute, (route) => false);
  }

  Future<void> report() async {
    if (await canLaunch(_bugReportUrl)) {
      await launch(_bugReportUrl);
    } else {
      throw 'Could not launch $_bugReportUrl';
    }
  }
}
