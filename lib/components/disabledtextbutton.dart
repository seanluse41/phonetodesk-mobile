import 'package:flutter/material.dart';

import '../styles/constants.dart';

class DisabledTextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: Colors.teal[100],
      elevation: 10.0,
      child: Row(
        children: <Widget>[
          Text(
            "Send",
            style: kButtonTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.send,
              color: Colors.white,
            ),
          )
        ],
      ),
      onPressed: null,
    );
  }
}
