import 'package:bmi/splashscreen.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MainsSplashsscreen());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          canvasColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
            headline2: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            bodyText1: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )),
      home: MyHomePage(),
    );
  }
}
