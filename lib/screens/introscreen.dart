import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:phone2web/screens/idcodescreen.dart';
import 'package:phone2web/screens/gottextscreen.dart';
import 'package:phone2web/styles/constants.dart';

class IntroScreen extends StatefulWidget {
  static String id = 'introscreen';

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _firestore = Firestore.instance;
  final _linkController = new TextEditingController();
  final _codeController = new TextEditingController();

  bool showSpinner = false;
  String linkText = "";
  int linkCode = Random().nextInt(99999);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone to Desk'),
        backgroundColor: Colors.pink[300],
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Text(
                "Store Text Here",
                style: TextStyle(fontSize: 35.0),
              ),
              TextField(
                controller: _linkController,
                onChanged: (value) {
                  linkText = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your text here',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _linkController.clear();
                    },
                  ),
                ),
              ),
              MaterialButton(
                  color: Colors.teal,
                  elevation: 10.0,
                  child: Text(
                    "Send",
                    style: kButtonTextStyle,
                  ),
                  onPressed: () {
                    showSpinner = true;
                    _firestore
                        .collection('links')
                        .add({
                          'link': linkText,
                          'id': linkCode,
                        })
                        .whenComplete(() => _linkController.clear())
                        .then((value) => showSpinner = false)
                        .then((value) => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    IdCodeScreen(linkID: linkCode),
                              ),
                            ));
                  }),
              SizedBox(
                height: 100.0,
              ),
              Text(
                "Get Text Back",
                style: kTextHeaderStyle,
              ),
              TextField(
                controller: _codeController,
                maxLength: 5,
                keyboardType: TextInputType.number,
                onChanged: (code) {
                  linkCode = int.parse(code);
                  print(linkCode);
                },
                decoration: InputDecoration(
                  hintText: 'Enter your 5 digit code here',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _codeController.clear();
                    },
                  ),
                ),
              ),
              MaterialButton(
                  color: Colors.teal,
                  elevation: 10,
                  child: Text(
                    "GET",
                    style: kButtonTextStyle,
                  ),
                  onPressed: () async {
                    showSpinner = true;
                    _firestore
                        .collection('links')
                        .where("id", isEqualTo: linkCode)
                        .snapshots()
                        .listen((event) => event.documents.forEach((element) {
                              linkText = element['link'];
                            }));
                    showSpinner = false;
                    _codeController.clear();

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GotTextScreen(link: linkText)));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
