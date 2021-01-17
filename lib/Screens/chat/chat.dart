import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobochat/constants.dart';
import 'package:mobochat/services/auth.dart';

class Chat extends StatelessWidget {
  final AuthService _authService = AuthService();

  _signOutUser(BuildContext context) {
    _authService.signOut();
    Navigator.pushReplacementNamed(context, LoginRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Chats",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25.0,
                        fontFamily: 'BalooBhaina'),
                  ),
                ),
                // FaIcon(FontAwesomeIcons.exit)
                Container(
                    margin: const EdgeInsets.only(right: 15.0),
                    child: GestureDetector(
                        onTap: () => _signOutUser(context),
                        child: Icon(
                          Icons.logout,
                        ))),
                // AlertDialog(
                //   title: Text("You want to Logout"),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
