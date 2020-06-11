import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradebook/ui/login/login_view.dart';

import 'core/services/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);

  setupServiceLocator();

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: MyApp(), //App(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 375.0,
      height: 812.0,
      allowFontScaling: true,
    );
    return LoginView();
  }
}
