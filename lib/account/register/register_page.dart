import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/widgets/j_raised_button.dart';

class RegisterPage extends StatefulWidget {
  static const routerName = '/account/register-page';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _registerBg = 'assets/jpg/app_bg.jpg';
  String _logo = 'assets/png/welcome_logo.png';
  bool _showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: true,
            bottom: true,
            left: false,
            right: false,
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_registerBg),
                  fit: BoxFit.fill,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitleAndLogo(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 30),
                            ..._buildTitles(),
                            SizedBox(height: 10),
                            ..._buildInputs(),
                            SizedBox(height: 20),
                            _buildRegisterButton()
                          ],
                        ),
                      ),
                    ]),
              ),
            )));
  }

  _buildTitleAndLogo() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    _logo,
                    height: 80,
                    width: 80,
                  ),
                  Text(
                    'THIS MUSIC',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          AppLocalization.registerStart,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  _buildTitles() {
    return [
      Text(AppLocalization.register,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: ThisMusicColors.button)),
      Text(AppLocalization.loginMsg,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.white))
    ];
  }

  _buildInputs() {
    return [
      TextFormField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              labelText: AppLocalization.name,
              fillColor: Colors.white10,
              filled: true,
              labelStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10),
              ))),
      SizedBox(height: 10),
      TextFormField(
          keyboardType: TextInputType.numberWithOptions(),
          textInputAction: TextInputAction.next,
          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              labelText: AppLocalization.phoneNumber,
              fillColor: Colors.white10,
              filled: true,
              labelStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10),
              ))),
      SizedBox(height: 10),
      TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              labelText: AppLocalization.email,
              fillColor: Colors.white10,
              filled: true,
              labelStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10),
              ))),
      SizedBox(height: 10),
      TextFormField(
          style: TextStyle(color: Colors.white),
          textInputAction: TextInputAction.next,
          obscureText: _showPassword,
          decoration: InputDecoration(
              labelText: AppLocalization.password,
              fillColor: Colors.white10,
              filled: true,
              labelStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                child: Icon(_showPassword ? EvaIcons.eyeOff : EvaIcons.eye),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ))),
      SizedBox(height: 10),
      TextFormField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          maxLines: 1,
          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              labelText: AppLocalization.userName,
              fillColor: Colors.white10,
              filled: true,
              labelStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10),
              ))),
      SizedBox(height: 10),
      TextFormField(
          keyboardType: TextInputType.datetime,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              labelText: AppLocalization.dateBirth,
              fillColor: Colors.white10,
              filled: true,
              labelStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10),
              ))),
    ];
  }

  _buildRegisterButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: JRaisedButton(onPressed: () {}, text: AppLocalization.register),
    );
  }
}
