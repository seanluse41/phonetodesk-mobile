import 'package:flutter/material.dart';
import 'package:phone2web/screens/introscreen.dart';
import 'package:phone2web/screens/aboutscreen.dart';

class GlobalDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pushNamed(context, IntroScreen.id);
            },
          ),
          ListTile(
              title: Text(
                "About",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              leading: Icon(Icons.info),
              onTap: () {
                Navigator.pushNamed(context, AboutScreen.id);
              }),
        ],
      ),
    );
  }
}
