import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 56.0;

  SimpleAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: barHeight + statusBarHeight,
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black54,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w500,
              fontSize: 26.0),
        ),
      ),
    );
  }
}
