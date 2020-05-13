import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:phone2web/services/firestore.dart';

import 'package:phone2web/components/appbar.dart';
import 'package:phone2web/components/sidedrawer.dart';
import 'package:phone2web/components/getcodebutton.dart';
import 'package:phone2web/components/gettextbutton.dart';
import 'package:phone2web/components/disabledcodebutton.dart';
import 'package:phone2web/components/disabledtextbutton.dart';

import 'package:phone2web/styles/constants.dart';

class IntroScreen extends StatefulWidget {
  static String id = 'introscreen';

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _fireStore = FireStoreProvider();

  final _linkController = new TextEditingController();
  final _codeController = new TextEditingController();

  bool _textBtnEnabled = false;
  bool _codeBtnEnabled = false;
  bool showSpinner = false;
  String linkText;
  int linkCode;

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
                    TextFormField(
                      controller: _linkController,
                      onChanged: (value) {
                        linkText = value;
                        if (linkText != "") {
                          setState(() {
                            _textBtnEnabled = true;
                          });
                        } else {
                          setState(() {
                            _textBtnEnabled = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your text here',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _linkController.clear();
                            setState(() {
                              _textBtnEnabled = false;
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 110.0,
                      child: _textBtnEnabled
                          ? GetCodeButton(
                              linkText: linkText,
                              fireStore: _fireStore,
                            )
                          : DisabledTextButton(),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "Get Text Back",
                      style: kTextHeaderStyle,
                    ),
                    TextFormField(
                      controller: _codeController,
                      inputFormatters: [
                        WhitelistingTextInputFormatter(
                          RegExp("[0-9]"),
                        ),
                      ],
                      maxLength: 5,
                      keyboardType: TextInputType.number,
                      onChanged: (code) {
                        linkCode = int.parse(code);
                        if (code.length > 0) {
                          setState(() {
                            _codeBtnEnabled = true;
                          });
                        } else {
                          setState(() {
                            _codeBtnEnabled = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your 5 digit code here',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _codeController.clear();
                            setState(() {
                              linkCode = null;
                              _codeBtnEnabled = false;
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 110.0,
                      child: _codeBtnEnabled
                          ? GetTextButton(
                              linkCode: linkCode,
                              fireStore: _fireStore,
                            )
                          : DisabledCodeButton(),
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
