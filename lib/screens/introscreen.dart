import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:phone2web/components/appbar.dart';
import 'package:phone2web/components/sidedrawer.dart';

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
      appBar: GlobalAppBar(),
      drawer: GlobalDrawer(),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                Column(
                  children: [
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
                    Container(
                      width: 110.0,
                      child: MaterialButton(
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
                    ),
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
                        _firestore
                            .collection('links')
                            .where("id", isEqualTo: linkCode)
                            .snapshots()
                            .listen(
                                (event) => event.documents.forEach((element) {
                                      linkText = element['link'];
                                    }));
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
                    Container(
                      width: 110.0,
                      child: MaterialButton(
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
                          _codeController.clear();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  GotTextScreen(link: linkText)));
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
