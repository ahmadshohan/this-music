import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import './music_player/music_player_page.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/tab/tab_navigator.dart';
import 'account/login/login_page.dart';
import 'account/register/register_page.dart';
import 'account/forgot_password/forget_password_page.dart';
import 'account/welcome/welcome_page.dart';
import 'colors.dart';

import 'splash/splash_page.dart';

class ThisMusicApp extends StatefulWidget {
  @override
  ThisMusicAppState createState() => ThisMusicAppState();
}

class ThisMusicAppState extends State<ThisMusicApp> {
  final _fontFamily = 'poppins';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: ThisMusicColors.navigationBar,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        // statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'THIS MUSIC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ThisMusicColors.button,
        canvasColor: ThisMusicColors.bg,
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
            color: ThisMusicColors.playerGradientLow,
            iconTheme: IconThemeData(color: Colors.white)),
        fontFamily: _fontFamily,
      ),
      initialRoute: SplashPage.routerName,
      routes: {
        SplashPage.routerName: (ctx) => SplashPage(),
        WelcomePage.routerName: (ctx) => WelcomePage(),
        RegisterPage.routerName: (ctx) => RegisterPage(),
        LoginPage.routerName: (ctx) => LoginPage(),
        ForgotPasswordPage.routerName: (ctx) => ForgotPasswordPage(),
        TabNavigator.routerName: (ctx) => TabNavigator(),
        MusicPlayerPage.routerName: (ctx) => MusicPlayerPage(),
      },
    );
  }

  static void setLang(BuildContext context, String lang) async {
    AppLocalization.setLang(context, lang);
    ThisMusicAppState state =
        context.findAncestorStateOfType<ThisMusicAppState>();
    state.setState(() {});
  }
}
