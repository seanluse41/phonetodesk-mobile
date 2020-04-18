import 'package:flutter/material.dart';

class GotTextScreen extends StatelessWidget {
  static String id = 'gottextscreen';
  final String link;

  GotTextScreen({@required this.link});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text(link),
        ],
      )),
    );
  }
}
