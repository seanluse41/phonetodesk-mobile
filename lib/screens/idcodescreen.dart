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
          Text(
            "Your ID Code:",
            style: kTextHeaderStyle,
          ),
          Text(
            linkID.toString(),
            style: kTextHeaderStyle,
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Head to www.phonetodesk.com to get your text back later.",
            ),
          ),
        ],
      )),
    );
  }
}
