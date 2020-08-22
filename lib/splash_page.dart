import 'dart:async';
import 'package:flutter/material.dart';
import 'welcome_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 6);
    return Timer(duration, route);
  }

  void route() {
    Navigator.of(context).pushReplacementNamed(WelcomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Image.asset(
            'assets/images/splash.jpg',
            fit: BoxFit.fill,
            height: 150,
          ),
        ),
      ),
    );
  }
}
