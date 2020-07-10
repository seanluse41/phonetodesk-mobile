import 'package:flutter/material.dart';

import '../styles/constants.dart';

class DisabledCodeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: Colors.teal[100],
      elevation: 10.0,
      child: Row(
        children: <Widget>[
          Text(
            "Get",
            style: kButtonTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Icon(
              Icons.cloud_download,
              color: Colors.white,
            ),
          )
        ],
      ),
      onPressed: null,
    );
  }
}
