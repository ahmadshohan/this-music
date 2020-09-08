import 'package:app_settings/app_settings.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:this_music/app_route.dart';
import 'package:this_music/settings/settings_controller.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/widgets/j_raised_button.dart';
import 'package:this_music/shared/widgets/loader.dart';

import '../colors.dart';

class SettingsPage extends StatefulWidget {
  final String title;

  const SettingsPage({Key key, this.title = "Settings"}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SettingsController _settingsController = SettingsController();
  void initState() {
    super.initState();
    Future<void>.delayed(Duration(milliseconds: 1000), () async {
      await _settingsController.init();
      // SongModel songModel = Provider.of<SongModel>(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: ThisMusicColors.button,
            title: Text(AppLocalization.settings,
                style: TextStyle(color: Colors.white))),
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  ThisMusicColors.flexibleBarGradientLow,
                  ThisMusicColors.flexibleBarGradientHigh
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topRight,
              )),
              child: SafeArea(
                  top: true,
                  bottom: true,
                  left: false,
                  right: false,
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                            _buildAvatar(),
                            SizedBox(height: 7),
                            Divider(color: Colors.grey),
                            SizedBox(height: 15),
                            _buildAccountManagement(),
                            _buildSoundSettings(),
                            _buildOfflineMode(),
                            _buildApplicationEvaluation(),
                            _buildAboutUs(),
                            _buildLanguage(),
                            _buildLinkedAccount(),
                            _buildLogout(),
                          ])))),
            ),
            Visibility(
                visible: _settingsController.loading,
                child: Center(child: Loader())),
          ],
        ));
  }

  _buildAvatar() {
    return CircleAvatar(
        radius: 50,
        backgroundColor: Colors.black12,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset('assets/png/avatar.png',
              width: 100, height: 100, fit: BoxFit.cover),
        ));
  }

  _buildAccountManagement() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoute.profileRoute),
      child: Card(
          color: ThisMusicColors.flexibleBarGradientHigh,
          elevation: 8,
          child: Container(
              padding: EdgeInsets.all(10),
              child: Row(children: <Widget>[
                Icon(
                  EvaIcons.personOutline,
                  size: 25,
                  color: ThisMusicColors.white,
                ),
                SizedBox(width: 10),
                Text(AppLocalization.accountManagement,
                    style: TextStyle(
                        color: ThisMusicColors.white,
                        fontWeight: FontWeight.bold)),
              ]))),
    );
  }

  _buildSoundSettings() {
    return GestureDetector(
      onTap: () async {
        await AppSettings.openSoundSettings();
      },
      child: Card(
          color: ThisMusicColors.flexibleBarGradientHigh,
          elevation: 8,
          child: Container(
              padding: EdgeInsets.all(10),
              child: Row(children: <Widget>[
                Icon(
                  Icons.settings_voice,
                  size: 25,
                  color: ThisMusicColors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(AppLocalization.soundSettings,
                    style: TextStyle(
                        color: ThisMusicColors.white,
                        fontWeight: FontWeight.bold)),
              ]))),
    );
  }

  _buildOfflineMode() {
    return Card(
        color: ThisMusicColors.flexibleBarGradientHigh,
        elevation: 8,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Row(children: <Widget>[
              Icon(
                EvaIcons.bellOff,
                color: ThisMusicColors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(AppLocalization.offlineMode,
                  style: TextStyle(
                      color: ThisMusicColors.white,
                      fontWeight: FontWeight.bold)),
              Spacer(),
              Switch(
                value: false,
                onChanged: (value) => {},
                activeTrackColor: Colors.grey,
                activeColor: ThisMusicColors.button,
              )
            ])));
  }

  _buildApplicationEvaluation() {
    return Card(
        color: ThisMusicColors.flexibleBarGradientHigh,
        elevation: 8,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Row(children: <Widget>[
              Icon(
                Icons.stars,
                color: ThisMusicColors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(AppLocalization.applicationEvaluation,
                  style: TextStyle(
                      color: ThisMusicColors.white,
                      fontWeight: FontWeight.bold)),
            ])));
  }

  _buildAboutUs() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoute.aboutUsRoute),
      child: Card(
          color: ThisMusicColors.flexibleBarGradientHigh,
          elevation: 8,
          child: Container(
              padding: EdgeInsets.all(10),
              child: Row(children: <Widget>[
                Icon(
                  EvaIcons.personOutline,
                  color: ThisMusicColors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(AppLocalization.aboutUs,
                    style: TextStyle(
                        color: ThisMusicColors.white,
                        fontWeight: FontWeight.bold)),
              ]))),
    );
  }

  _buildLogout() {
    return GestureDetector(
      onTap: () async {
        await _settingsController.logout(context);
      },
      child: Card(
          color: ThisMusicColors.flexibleBarGradientHigh,
          elevation: 8,
          child: Container(
              padding: EdgeInsets.all(10),
              child: Row(children: <Widget>[
                Icon(
                  EvaIcons.logOut,
                  color: ThisMusicColors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(AppLocalization.logout,
                    style: TextStyle(
                        color: ThisMusicColors.white,
                        fontWeight: FontWeight.bold)),
              ]))),
    );
  }

  _buildLanguage() {
    return GestureDetector(
      onTap: () => showChangeLanguageDialog(),
      child: Card(
          color: ThisMusicColors.flexibleBarGradientHigh,
          elevation: 8,
          child: Observer(
            builder: (_) => Container(
                padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 20,
                    bottom: _settingsController.lang == AppLocalization.ar
                        ? 20
                        : 20),
                child: Row(children: <Widget>[
                  Icon(
                    Icons.language,
                    color: ThisMusicColors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(AppLocalization.language,
                      style: TextStyle(
                          color: ThisMusicColors.white,
                          fontWeight: FontWeight.bold)),
                  Spacer(),
                  Row(children: <Widget>[
                    Text(_settingsController.getCurrentLang(),
                        style: TextStyle(color: ThisMusicColors.white)),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_ios, color: ThisMusicColors.white)
                  ])
                ])),
          )),
    );
  }

  _buildLinkedAccount() {
    return Card(
        color: ThisMusicColors.flexibleBarGradientHigh,
        elevation: 8,
        child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
            child: Row(children: <Widget>[
              Icon(
                Icons.phone_android,
                color: ThisMusicColors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(AppLocalization.linkedAccount,
                  style: TextStyle(
                      color: ThisMusicColors.white,
                      fontWeight: FontWeight.bold)),
              Spacer(),
              Row(children: <Widget>[
                Text('Facebook',
                    style: TextStyle(color: ThisMusicColors.white)),
                SizedBox(width: 5),
                Icon(Icons.arrow_forward_ios, color: ThisMusicColors.white)
              ])
            ])));
  }

  showChangeLanguageDialog() {
    showModal(
        configuration: FadeScaleTransitionConfiguration(
            transitionDuration: Duration(milliseconds: 400),
            reverseTransitionDuration: Duration(milliseconds: 400)),
        context: context,
        builder: (_) => new SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                contentPadding: EdgeInsets.all(20),
                children: <Widget>[
                  Text(AppLocalization.changeLanguage,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ThisMusicColors.playerGradientLow)),
                  SizedBox(height: 10),
                  SimpleDialogOption(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    onPressed: () {
                      Navigator.pop(context);
                      _settingsController.setCurrentLang(
                          context, AppLocalization.en);
                    },
                    child: _buildLangRow('assets/lang/usa.png', 'English'),
                  ),
                  SimpleDialogOption(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    onPressed: () {
                      Navigator.pop(context);
                      _settingsController.setCurrentLang(
                          context, AppLocalization.ar);
                    },
                    child: _buildLangRow('assets/lang/saudi.png', 'العربية'),
                  ),
                  SimpleDialogOption(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    onPressed: () {
                      Navigator.pop(context);
                      _settingsController.setCurrentLang(
                          context, AppLocalization.tr);
                    },
                    child: _buildLangRow('assets/lang/turkey.png', 'Türkçe'),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 43,
                    width: double.infinity,
                    child: Observer(
                      builder: (_) => JRaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: AppLocalization.update),
                    ),
                  )
                ]));
  }

  _buildLangRow(String image, String name) {
    return Row(
      children: <Widget>[
        Container(
            width: 26.0,
            height: 26.0,
            padding: const EdgeInsets.all(1.0),
            decoration: new BoxDecoration(
              color: Colors.white, // border color
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(image, width: 24, height: 24))),
        SizedBox(width: 10),
        Container(
            child: Text(name), padding: EdgeInsets.only(left: 5, right: 5))
      ],
    );
  }
}
