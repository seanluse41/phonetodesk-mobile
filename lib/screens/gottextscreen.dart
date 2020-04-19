import 'package:flutter/material.dart';
import 'package:phone2web/styles/constants.dart';
import 'package:phone2web/components/appbar.dart';
import 'package:phone2web/components/sidedrawer.dart';

import '../styles/constants.dart';

class GotTextScreen extends StatelessWidget {
  static String id = 'gottextscreen';
  final String link;

  GotTextScreen({@required this.link});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(),
      drawer: GlobalDrawer(),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Your text back:",
              style: kTextHeaderStyle,
            ),
          ),
          Center(
            child: Text(
              link,
              style: kTextHeaderStyle,
            ),
          ),
        ],
      )),
    );
  }
}
