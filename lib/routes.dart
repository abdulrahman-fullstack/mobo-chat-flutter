import 'package:flutter/widgets.dart';

import 'constants.dart';
import 'Screens/home/home.dart';
import 'Screens/login/login.dart';
import 'Screens/splash_screen.dart';

final Map<String, Widget> routesMap = {
  SplashScreenRoute: SplashScreen(),
  LoginRoute: Login(),
  HomeRoute: Home(),
};
