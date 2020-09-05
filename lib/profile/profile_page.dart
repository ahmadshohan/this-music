import 'package:flutter/material.dart';
import 'package:this_music/app_route.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/widgets/j_raised_button.dart';
import './edit_profile/edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThisMusicColors.BottomPanel,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: ThisMusicColors.button,
            title: Text(AppLocalization.profile,
                style: TextStyle(color: Colors.white))),
        body: SafeArea(
            top: true,
            bottom: true,
            left: false,
            right: false,
            child: Stack(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 10, top: 10),
                  child: SingleChildScrollView(
                      child: Column(children: <Widget>[
                    _buildPersonalInfo(),
                    _buildThisMusicLogo(),
                  ])))
            ])));
  }

  _buildPersonalInfo() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(AppLocalization.personalInformation,
                  style: TextStyle(
                      color: ThisMusicColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 13),
              _buildAvatarEmailName(),
              SizedBox(height: 13),
              _buildName(),
              SizedBox(height: 13),
              _buildPhoneNumber(),
              SizedBox(height: 13),
              _buildEmail(),
              SizedBox(height: 13),
              _buildPassword(),
              SizedBox(height: 13),
              _buildEditInfo(),
            ]));
  }

  _buildAvatarEmailName() {
    return Row(
      children: <Widget>[
        CircleAvatar(
            radius: 50,
            backgroundColor: Colors.black12,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset('assets/png/avatar.png',
                  width: 100, height: 100, fit: BoxFit.cover),
            )),
        SizedBox(width: 15),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppLocalization.yourName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: ThisMusicColors.white),
            ),
            Text(AppLocalization.email,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: ThisMusicColors.white))
          ],
        )
      ],
    );
  }

  _buildName() {
    return TextFormField(
        initialValue: AppLocalization.yourName,
        enabled: false,
        style: TextStyle(color: ThisMusicColors.white),
        decoration: InputDecoration(
            labelText: AppLocalization.yourName,
            fillColor: Colors.white30,
            filled: true,
            labelStyle: TextStyle(color: ThisMusicColors.white),
            contentPadding: EdgeInsets.all(16),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThisMusicColors.button)),
            border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5))));
  }

  _buildPhoneNumber() {
    return TextFormField(
        initialValue: AppLocalization.phoneNumber,
        enabled: false,
        style: TextStyle(color: ThisMusicColors.white),
        decoration: InputDecoration(
            labelText: AppLocalization.phoneNumber,
            filled: true,
            fillColor: Colors.white30,
            labelStyle: TextStyle(color: ThisMusicColors.white),
            contentPadding: EdgeInsets.all(16),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThisMusicColors.button)),
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5),
            )));
  }

  _buildEmail() {
    return TextFormField(
        initialValue: AppLocalization.email,
        enabled: false,
        style: TextStyle(color: ThisMusicColors.white),
        decoration: InputDecoration(
            labelText: AppLocalization.email,
            fillColor: Colors.white30,
            filled: true,
            labelStyle: TextStyle(color: ThisMusicColors.white),
            contentPadding: EdgeInsets.all(16),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThisMusicColors.button)),
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5),
            )));
  }

  _buildPassword() {
    return TextFormField(
        initialValue: AppLocalization.password,
        enabled: false,
        style: TextStyle(color: ThisMusicColors.white),
        decoration: InputDecoration(
            labelText: AppLocalization.password,
            fillColor: Colors.white30,
            filled: true,
            labelStyle: TextStyle(color: ThisMusicColors.white),
            contentPadding: EdgeInsets.all(16),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThisMusicColors.button)),
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5),
            )));
  }

  _buildEditInfo() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: JRaisedButton(
          onPressed: () =>
              Navigator.pushNamed(context, AppRoute.editProfileRoute),
          text: AppLocalization.editInformations),
    );
  }

  _buildThisMusicLogo() {
    return Image.asset(
      "assets/png/app_logo.png",
      height: MediaQuery.of(context).size.height * 0.25,
    );
  }
}
