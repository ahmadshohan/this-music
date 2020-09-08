import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:this_music/app_route.dart';
import 'package:this_music/music/album_songs/album_songs_page.dart';
import 'package:this_music/music/category_albums/category_albums_page.dart';
import 'package:this_music/music/player/music_player_page.dart';
import 'package:this_music/settings/about/aboutus_page.dart';
import 'package:this_music/splash/splash_page.dart';
import './profile/profile_page.dart';
import './profile/edit_profile/edit_profile_page.dart';
import 'package:this_music/settings/settings_page.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/tab/tab_navigator.dart';
import 'account/login/login_page.dart';
import 'account/register/register_page.dart';
import 'account/forgot_password/forget_password_page.dart';
import 'account/welcome/welcome_page.dart';
import 'colors.dart';

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
      home: AudioServiceWidget(child: SplashPage()),
      routes: {
        AppRoute.splashRoute: (ctx) => SplashPage(),
        AppRoute.welcomeRoute: (ctx) => WelcomePage(),
        AppRoute.registerRoute: (ctx) => RegisterPage(),
        AppRoute.loginRoute: (ctx) => LoginPage(),
        AppRoute.forgotPasswordRoute: (ctx) => ForgotPasswordPage(),
        AppRoute.tabRoute: (ctx) => TabNavigator(),
        AppRoute.musicPlayerRoute: (ctx) => MusicPlayerPage(),
        AppRoute.settingsRoute: (ctx) => SettingsPage(),
        AppRoute.aboutUsRoute: (ctx) => AboutUsPage(),
        AppRoute.profileRoute: (ctx) => ProfilePage(),
        AppRoute.editProfileRoute: (ctx) => EditProfilePage(),
        AppRoute.albumSongsRoute: (ctx) => AlbumSongsPage(),
        AppRoute.categoryAlbumsRoute: (ctx) => CategoryAlbumsPage(),
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
