import 'package:flutter/material.dart';
import 'package:gradebook/ui/home/home_view.dart';
import 'package:gradebook/ui/login/login_view.dart';
import 'package:gradebook/ui/user_select/user_select_view.dart';

const String HomeViewRoute = '/home';
const String LoginViewRoute = '/login';
const String UserSelectViewRoute = '/userselect';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => HomeView());
    case LoginViewRoute:
      return MaterialPageRoute(builder: (context) => LoginView());
    case UserSelectViewRoute:
      return MaterialPageRoute(builder: (context) => UserSelectView());
    default:
      return MaterialPageRoute(builder: (context) => HomeView());
  }
}
