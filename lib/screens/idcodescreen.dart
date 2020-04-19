import 'package:flutter/material.dart';
import 'package:phone2web/styles/constants.dart';
import 'package:phone2web/components/appbar.dart';
import 'package:phone2web/components/sidedrawer.dart';

class IdCodeScreen extends StatelessWidget {
  static String id = 'idcodescreen';
  final int linkID;

  IdCodeScreen({@required this.linkID});

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
              "Your ID Code:",
              style: kTextHeaderStyle,
            ),
          ),
          Center(
            child: Text(
              linkID.toString(),
              style: kTextHeaderStyle,
            ),
          ),
        ],
      )),
    );
  }
}
