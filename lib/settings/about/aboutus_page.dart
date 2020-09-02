import 'package:flutter/material.dart';
import 'package:this_music/shared/localization/app_localization.dart';

import '../../colors.dart';

class AboutUsPage extends StatefulWidget {
  static const routerName = '/settings/about/aboutus-page';
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: ThisMusicColors.button,
            title: Text(AppLocalization.aboutUs,
                style: TextStyle(color: Colors.white))),
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              padding: EdgeInsets.all(10),
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
                            _buildVersionNumber(),
                            _buildUsingRules(),
                          ])))),
            ),
          ],
        ));
  }

  _buildVersionNumber() {
    return Column(
      children: <Widget>[
        Text('Version 0.0.1'),
      ],
    );
  }

  _buildUsingRules() {
    return GestureDetector(
        onTap: () {}, child: Text('Kulanim sartlari ve kusolan'));
  }
}
