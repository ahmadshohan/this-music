import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:this_music/account/welcome/welcome_page.dart';
import 'package:this_music/shared/widgets/thismusic_logo.dart';
import 'package:this_music/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  static const routerName = '/splash/splash-page';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashController _splashController = SplashController();

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 5), () async => _splashController.init(context));
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
