import 'package:flutter/material.dart';
import 'package:phone2web/services/firestore.dart';
import 'package:phone2web/styles/constants.dart';
import 'package:phone2web/screens/gottextscreen.dart';

class GetTextButton extends StatelessWidget {
  GetTextButton({this.linkCode, this.fireStore});

  String linkText;
  final int linkCode;
  final FireStoreProvider fireStore;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.teal,
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
      onPressed: () async {
        print("code button pushed.");
        linkText = await fireStore.getLink(linkCode);
        print(linkText);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GotTextScreen(link: linkText)));
      },
    );
  }
}
