import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:this_music/login/login_page.dart';
import 'package:this_music/register/register_page.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'colors.dart';
import 'welcome/welcome_page.dart';
import 'splash/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(ThisMusicApp());
}

class ThisMusicApp extends StatelessWidget {
  final _fontFamily = 'poppins';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: ThisMusicColors.navigationBar,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
//      locale: context.locale,
      supportedLocales: AppLocalization.supportedLocales,
      title: 'This Music',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: ThisMusicColors.button,
          canvasColor: ThisMusicColors.bg,
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
              color: ThisMusicColors.splashGradientLow,
              iconTheme: IconThemeData(color: Colors.white)),
          fontFamily: _fontFamily),
      home: SplashPage(),
      routes: {
        SplashPage.routerName: (ctx) => SplashPage(),
        WelcomePage.routerName: (ctx) => WelcomePage(),
        RegisterPage.routerName: (ctx) => RegisterPage(),
        LoginPage.routerName: (ctx) => LoginPage(),
      },
    );
  }
}
