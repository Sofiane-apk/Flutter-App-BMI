import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'main.dart';

class MainsSplashsscreen extends StatelessWidget {
  const MainsSplashsscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'body mass index',
      home: Scaffold(
        body: EasySplashScreen(
          navigator: MyApp(),
          showLoader: false,
          logo: Image.asset('assets/splash.png'),
          backgroundColor: Color(0xFF607D8B),
          logoSize: 170,
          durationInSeconds: 2,
        ),
      ),
    );
  }
}
