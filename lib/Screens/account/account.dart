import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobochat/constants.dart';
import 'package:provider/provider.dart';

import 'package:mobochat/shared/mb.appbar.dart';
import '../../services/auth.dart';

class Account extends StatelessWidget {
  final AuthService _authService = AuthService();

  _signOutUser(BuildContext context) {
    _authService.signOut();
    Navigator.pushReplacementNamed(context, LoginRoute);
  }

  @override
  Widget build(BuildContext context) {
    User _currentUser = Provider.of<User>(context);
    return Scaffold(
      // appBar: MBAppBar("Account"),
      body: Container(
        margin: const EdgeInsets.only(top: 30.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Column(children: [
              Container(
                // constraints: BoxConstraints.expand(),
                width: 80.0,
                height: 80.0,
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: _currentUser?.photoURL != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image.network(
                          _currentUser?.photoURL,
                          height: 80.0,
                          width: 80.0,
                        ),
                      )
                    : Center(
                        child: FaIcon(
                          FontAwesomeIcons.userAlt,
                          size: 55,
                        ),
                      ),
              ),
              Text(
                "Hello ${_currentUser?.displayName ?? ""}",
                style: TextStyle(fontSize: 20, color: Colors.white54),
              ),
              FlatButton(
                  onPressed: () => _signOutUser(context), child: Text("LOGOUT"))
            ])
          ],
        ),
      ),
    );
  }
}
