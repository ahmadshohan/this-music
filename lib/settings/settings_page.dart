import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:this_music/settings/about/aboutus_page.dart';
import 'package:this_music/settings/settings_controller.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/widgets/j_raised_button.dart';
import 'package:this_music/shared/widgets/loader.dart';

import '../colors.dart';

class SettingsPage extends StatefulWidget {
  static const routerName = '/settings/settings-page';
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
                  image: DecorationImage(
                image: AssetImage('assets/jpg/app_bg.jpg'),
                fit: BoxFit.fill,
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
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                "assets/jpg/ahmad.jpg",
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
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

  _buildAccountManagement() {
    return Card(
        elevation: 8,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Row(children: <Widget>[
              Icon(
                EvaIcons.personOutline,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(AppLocalization.accountManagement,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ])));
  }

  _buildSoundSettings() {
    return Card(
        elevation: 8,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Row(children: <Widget>[
              Icon(
                Icons.settings_voice,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(AppLocalization.soundSettings,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ])));
  }

  _buildOfflineMode() {
    return Card(
        elevation: 8,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Row(children: <Widget>[
              Icon(EvaIcons.bellOff),
              SizedBox(
                width: 10,
              ),
              Text(AppLocalization.offlineMode,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
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
        elevation: 8,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Row(children: <Widget>[
              Icon(Icons.stars),
              SizedBox(
                width: 10,
              ),
              Text(AppLocalization.applicationEvaluation,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ])));
  }

  _buildAboutUs() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AboutUsPage.routerName),
      child: Card(
          elevation: 8,
          child: Container(
              padding: EdgeInsets.all(10),
              child: Row(children: <Widget>[
                Icon(EvaIcons.personOutline),
                SizedBox(
                  width: 10,
                ),
                Text(AppLocalization.aboutUs,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ]))),
    );
  }

  _buildLogout() {
    return GestureDetector(
      onTap: () async {
        await _settingsController.logout(context);
      },
      child: Card(
          elevation: 8,
          child: Container(
              padding: EdgeInsets.all(10),
              child: Row(children: <Widget>[
                Icon(EvaIcons.logOut),
                SizedBox(
                  width: 10,
                ),
                Text(AppLocalization.logout,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ]))),
    );
  }

  _buildLanguage() {
    return GestureDetector(
      onTap: () => showChangeLanguageDialog(),
      child: Card(
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
                  Icon(Icons.language),
                  SizedBox(
                    width: 10,
                  ),
                  Text(AppLocalization.language,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Row(children: <Widget>[
                    Text(_settingsController.getCurrentLang(),
                        style: TextStyle(color: Colors.black38)),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_ios, color: Colors.black38)
                  ])
                ])),
          )),
    );
  }

  _buildLinkedAccount() {
    return Card(
        elevation: 8,
        child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
            child: Row(children: <Widget>[
              Icon(Icons.phone_android),
              SizedBox(
                width: 10,
              ),
              Text(AppLocalization.linkedAccount,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Spacer(),
              Row(children: <Widget>[
                Text('Facebook', style: TextStyle(color: Colors.black38)),
                SizedBox(width: 5),
                Icon(Icons.arrow_forward_ios, color: Colors.black38)
              ])
            ])));
  }

  showChangeLanguageDialog() {
    showDialog(
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
                    height: 40,
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
