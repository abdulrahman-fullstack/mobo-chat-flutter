import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobochat/constants.dart';
import 'package:provider/provider.dart';

class Stories extends StatelessWidget {
  _navigateToAccount(BuildContext context) {
    Navigator.pushNamed(context, AccountRoute);
  }

  @override
  Widget build(BuildContext context) {
    User currentUser = Provider.of<User>(context);
    return Container(
      margin: MediaQuery.of(context).padding,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 55, 55, 55),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 70,
                margin: const EdgeInsets.only(bottom: 20, top: 20),
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: BlueThemeColor,
                      ),
                      child: Icon(
                        Icons.search,
                        size: 30.0,
                        color: Colors.black.withAlpha(150),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    // offset: Offset(0.0, 0.0),
                    blurRadius: 15.0,
                    color: Color.fromARGB(200, 28, 28, 28),
                    spreadRadius: 2.0,
                  )
                ],
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
              child: Container(
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      RedThemeColor,
                      YellowThemeColor,
                      // TealThemeColor,
                      // BlueThemeColor,
                    ],
                  ),
                ),
                child: GestureDetector(
                  onTap: () => _navigateToAccount(context),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black),
                      child: Image.network(
                        currentUser?.photoURL,
                        height: 70.0,
                        width: 70.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
