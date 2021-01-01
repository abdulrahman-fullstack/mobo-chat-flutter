import 'package:flutter/material.dart';

class MBAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final Color backgroundColor;
  final String _title;

  MBAppBar(this._title, {Key key, this.backgroundColor = Colors.black12})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title),
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: true,
    );
  }
}

// class MBAppBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar();
//   }
// }
