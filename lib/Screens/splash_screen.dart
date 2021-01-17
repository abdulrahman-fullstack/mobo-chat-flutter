import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobochat/constants.dart';
import 'package:mobochat/services/auth.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigator.pushNamed(context, LoginRoute);
    User user = FirebaseAuth.instance.currentUser;
    Future.delayed(Duration(seconds: 1), () {
      String newRoute = '';
      if (user != null) {
        newRoute = HomeRoute;
      } else {
        newRoute = LoginRoute;
      }
      Navigator.pushReplacementNamed(context, newRoute);
    });
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(255, 86, 204, 242)),
          ),
        ),
      ),
    );
  }
}
