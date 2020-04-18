import 'package:flutter/material.dart';
import 'package:phone2web/styles/constants.dart';

class IdCodeScreen extends StatelessWidget {
  static String id = 'idcodescreen';
  final int linkID;

  IdCodeScreen({@required this.linkID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text(
            linkID.toString(),
            style: kTextHeaderStyle,
          ),
        ],
      )),
    );
  }
}
