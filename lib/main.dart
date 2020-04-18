import 'package:flutter/material.dart';
import 'screens/introscreen.dart';
import 'screens/gottextscreen.dart';
import 'screens/idcodescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone2Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: IntroScreen.id,
      routes: {
        IntroScreen.id: (context) => IntroScreen(),
        GotTextScreen.id: (context) => GotTextScreen(
              link: 'www.seanbase.com',
            ),
        IdCodeScreen.id: (context) => IdCodeScreen(
              linkID: 0,
            ),
      },
    );
  }
}
