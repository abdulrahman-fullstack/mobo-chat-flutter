import 'package:flutter/material.dart';
import '../../Widgets/MBAppBar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MBAppBar("Home"),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Hey there",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Hello world",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
