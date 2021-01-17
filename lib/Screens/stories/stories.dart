import 'package:flutter/material.dart';
import 'package:mobochat/shared/mb.appbar.dart';

class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withAlpha(10),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          )),
      child: Column(children: [
        SizedBox(
          height: 50.0,
        ),
        Row(
          children: [
            SizedBox(
              height: 80.0,
            )
          ],
        ),
      ]),
    );
  }
}
