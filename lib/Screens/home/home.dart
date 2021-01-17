import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobochat/Screens/chat/chat.dart';
import 'package:mobochat/Screens/stories/stories.dart';
import 'package:mobochat/constants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black12),
        // decoration: BoxDecoration(color: TealThemeColor),
        child: Column(
          children: [
            Stories(),
            Chat(),
          ],
        ),
      ),
    );
  }
}
