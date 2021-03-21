import 'package:flutter/widgets.dart';

import 'constants.dart';
import 'Screens/home/home.dart';
import 'Screens/login/login.dart';
import 'Screens/splash_screen.dart';
import 'Screens/account/account.dart';

final Map<String, Widget> routesMap = {
  SplashScreenRoute: SplashScreen(),
  LoginRoute: Login(),
  HomeRoute: Home(),
  AccountRoute: Account()
};
