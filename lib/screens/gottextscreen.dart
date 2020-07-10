import 'package:flutter/material.dart';

import '../components/appbar.dart';
import '../components/sidedrawer.dart';
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
            child: SelectableText(
              link,
              style: kTextHeaderStyle,
              toolbarOptions: ToolbarOptions(
                copy: true,
                selectAll: true,
                cut: false,
                paste: false,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
