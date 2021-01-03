import 'package:flutter/material.dart';
import 'package:mobochat/constants.dart';
import 'package:mobochat/services/auth.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _logoWidget(),
          _loginButton(
              "LOGIN WITH GOOGLE", () => _onGoogleLogin(context), true),
          _loginButton(
              "Continue as Guest", _onLoginPress, false, 250.0, Colors.white10),
        ],
      ),
    ));
  }

  Widget _logoWidget() {
    return Container(
      width: 100.0,
      height: 100.0,
      margin: const EdgeInsets.only(top: 50.0, bottom: 50.0),
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: Colors.black26,
            spreadRadius: 2.0,
          )
        ],
      ),
      // BoxShadow(blurRadius: 20, color: Colors.black, spreadRadius: 30.0),
      child: Image.asset(
        "assets/icons/logo.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _loginButton(
    String text,
    VoidCallback handler, [
    bool isGoogleLogin = false,
    double width = 280.0,
    Color color = Colors.white24,
  ]) {
    var buttonText = Text(
      text,
      style: TextStyle(letterSpacing: .7),
    );
    var googleIcon = Container(
      width: 30.0,
      height: 30.0,
      margin: EdgeInsets.only(left: 10),
      child: Image.asset(
        "assets/icons/google.png",
        fit: BoxFit.cover,
      ),
    );
    return Column(
      children: [
        Container(
          width: width,
          margin: const EdgeInsets.only(top: 15.0, bottom: 15.0),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: isGoogleLogin ? [buttonText, googleIcon] : [buttonText],
            ),
            onPressed: handler,
            color: color,
            minWidth: 250.0,
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
          ),
        ),
      ],
    );
  }

  _onLoginPress() {
    print("Logging in user");
  }

  _onGoogleLogin(BuildContext context) {
    print("Logging User on Google");
    // authService.loading.add(true);
    authService.googleSignIn().then((user) => {
          if (user != null)
            Navigator.pushNamed(context, HomeRoute)
          else
            print("No user Logged In")
        });
  }
}
