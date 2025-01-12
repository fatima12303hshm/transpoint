import 'package:flutter/material.dart';
import 'package:transpoint/src/ui/main_page.dart';
import 'package:transpoint/src/ui/user/pages/login_page.dart';

class Routes {
  static String loginPage = 'login';
  static String mainPage = 'main';

  Map<String, WidgetBuilder> get routes =>
      {loginPage: (context) => LoginPage(), mainPage: (context) => MainPage()};
}
