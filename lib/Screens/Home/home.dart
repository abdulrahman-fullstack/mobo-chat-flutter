import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobochat/services/auth.dart';
import '../../shared/mb.appbar.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();
  final User _currentUser = FirebaseAuth.instance.currentUser;

  signOutUser(BuildContext context) {
    _authService.signOut();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MBAppBar("Home"),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Column(children: [
              Container(
                // constraints: BoxConstraints.expand(),
                height: 350.0,
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                // child: Image.asset(
                //   "assets/images/nature.jpg",
                //   fit: BoxFit.contain,
                // ),
                child: Image.network(_currentUser.photoURL),
              ),
              Text(
                "Hello " + _currentUser.displayName ?? "world",
                style: TextStyle(fontSize: 20, color: Colors.white54),
              ),
              FlatButton(
                  onPressed: () => signOutUser(context), child: Text("LOGOUT"))
            ])
          ],
        ),
      ),
    );
  }
}
