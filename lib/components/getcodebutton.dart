import 'package:flutter/material.dart';

import '../screens/idcodescreen.dart';
import '../services/firestore.dart';
import '../styles/constants.dart';

class GetCodeButton extends StatelessWidget {
  
  GetCodeButton({this.linkText, this.fireStore});

  final String linkText;
  final FireStoreProvider fireStore;
  int linkCode;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.teal,
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
      onPressed: () async {
        linkCode = await fireStore.getCode(linkText);
        print(linkCode);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IdCodeScreen(linkID: linkCode)));
      },
    );
  }
}
