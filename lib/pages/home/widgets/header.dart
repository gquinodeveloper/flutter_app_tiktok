import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Following",
          style: TextStyle(
            color: Colors.white54,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 8),
        Text(
          "|",
          style: TextStyle(
            color: Colors.white30,
            fontSize: 17,
          ),
        ),
        SizedBox(width: 8),
        Text(
          "For you",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
