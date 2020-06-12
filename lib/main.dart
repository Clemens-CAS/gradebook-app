import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradebook/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/services/service_locator.dart';

import 'package:gradebook/router.dart' as router;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  setupServiceLocator();

  var initialRoute = router.LoginViewRoute;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString('studentId') != null) {
    print('Has Data');
  }

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        backgroundColor: AppColors.white,
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: initialRoute,
      debugShowCheckedModeBanner: false,
    ),
  );
}
