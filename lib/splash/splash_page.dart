import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:this_music/shared/widgets/thismusic_logo.dart';
import '../welcome/welcome_page.dart';

class SplashPage extends StatefulWidget {
  static const routerName = '/splash/splash-page';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future _init() async {
    await Future.delayed(Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, WelcomePage.routerName));
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
