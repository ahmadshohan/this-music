import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:this_music/shared/localization/app_localization.dart';

import '../../colors.dart';

class AboutUsPage extends StatefulWidget {
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
              color: Colors.black,
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
                            Divider(thickness: 1, color: ThisMusicColors.white),
                            _buildUsingRules(),
                            Divider(thickness: 1, color: ThisMusicColors.white),
                            // _buildUsingRules(),
                            // Divider(thickness: 2),
                            // _buildUsingRules(),
                            // Divider(thickness: 2),
                            // _buildUsingRules(),
                          ])))),
            ),
          ],
        ));
  }

  _buildVersionNumber() {
    return Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          AppLocalization.versionNumber,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }

  _buildUsingRules() {
    return GestureDetector(
        onTap: () {},
        child: Card(
          elevation: 8,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(AppLocalization.termsConditions,
                style: TextStyle(fontSize: 18)),
          ),
        ));
  }
}
