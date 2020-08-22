import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:this_music/shared/widgets/thismusic_logo.dart';
import 'welcome_page.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash-page';
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
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 4),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ThisMusicLogo(),
    );
  }
}
