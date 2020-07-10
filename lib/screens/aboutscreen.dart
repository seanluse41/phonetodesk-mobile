import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/appbar.dart';
import '../components/sidedrawer.dart';
import '../styles/constants.dart';

class AboutScreen extends StatelessWidget {
  static String id = "aboutscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(),
      drawer: GlobalDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ColorizeAnimatedTextKit(
                    text: ["About this"],
                    colors: [
                      Colors.pink[200],
                      Colors.purple,
                      Colors.yellow,
                      Colors.red
                    ],
                    textStyle: kTextHeaderStyle,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        text:
                            "This app was made to easily send text and links between my phone and desktop. Visit ",
                        children: [
                          TextSpan(
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                            text: "www.phonetodesk.com",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => _launchURL,
                          ),
                          TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            text: " to see more.",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = "www.phonetodesk.com";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "Could not launch $url";
  }
}
