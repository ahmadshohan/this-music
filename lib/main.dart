import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'colors.dart';
import 'welcome_page.dart';
import 'splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    ThisMusicApp(),
  );
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
////      localizationsDelegates: context.localizationDelegates,
//      supportedLocales: context.supportedLocales,
//      locale: context.locale,
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
        SplashPage.routeName: (ctx) => SplashPage(),
        WelcomePage.routeName: (ctx) => WelcomePage(),
      },
    );
  }
}
