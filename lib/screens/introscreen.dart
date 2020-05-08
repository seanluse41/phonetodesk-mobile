import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:phone2web/components/appbar.dart';
import 'package:phone2web/components/sidedrawer.dart';

import 'package:phone2web/screens/idcodescreen.dart';
import 'package:phone2web/screens/gottextscreen.dart';
import 'package:phone2web/styles/constants.dart';

import 'package:phone2web/services/firestore.dart';

class IntroScreen extends StatefulWidget {
  static String id = 'introscreen';

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _linkController = new TextEditingController();
  final _codeController = new TextEditingController();

  bool showSpinner = false;
  String linkText;
  int linkCode;
  var _fireStore = FireStoreProvider();

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
                        onPressed: () async {
                          showSpinner = true;
                          linkCode = await _fireStore.getCode(linkText);
                          print(linkCode);
                          showSpinner = false;
                          _linkController.clear();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      IdCodeScreen(linkID: linkCode)));
                        },
                      ),
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
                          showSpinner = true;
                          linkText = await _fireStore.getLink(linkCode);
                          print(linkText);
                          _codeController.clear();
                          showSpinner = false;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GotTextScreen(link: linkText)));
                        },
                      ),
                    ),
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
