import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradebook/core/services/txconnect_service.dart';
import 'package:gradebook/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/services/service_locator.dart';

import 'package:gradebook/router.dart' as router;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  setupServiceLocator();

  var initialRoute = router.LoginViewRoute;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  // TODO: REMOVE FOR PROD
  await prefs.clear();

  if (prefs.getString('studentId') != null) {
    initialRoute = router.TabsViewRoute;
    var _txService = locator<TxConnectService>();
    await _txService.login(
      username: prefs.getString('username'),
      password: prefs.getString('password'),
    );
    await _txService.getStudents();
    await _txService.switchStudent(studentId: prefs.getString('studentId'));
  }

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        backgroundColor: AppColors.white,
        primaryColor: AppColors.textColor,
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: initialRoute, //router.UserSelectViewRoute,
      debugShowCheckedModeBanner: false,
    ),
  );
}
