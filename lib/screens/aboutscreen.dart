import 'package:flutter/material.dart';
import 'package:phone2web/styles/constants.dart';
import 'package:phone2web/components/appbar.dart';
import 'package:phone2web/components/sidedrawer.dart';

class AboutScreen extends StatelessWidget {
  static String id = "aboutscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(),
      drawer: GlobalDrawer(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text("About"),
            ),
          ],
        ),
      ),
    );
  }
}
