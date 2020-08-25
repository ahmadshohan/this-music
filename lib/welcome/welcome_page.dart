import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:this_music/account/login/login_page.dart';
import 'package:this_music/account/register/register_page.dart';
import 'package:this_music/app_widget.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/widgets/j_outline_button.dart';
import 'package:this_music/shared/widgets/j_raised_buttonborder.dart';

enum PopLanguageOption { Turkish, English, Arabic }

class WelcomePage extends StatefulWidget {
  static const routerName = '/welcome-page';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String _welcomeBg = 'assets/jpg/app_bg.jpg';
  String _logo = 'assets/png/welcome_logo.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        left: false,
        right: false,
        child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_welcomeBg),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: <Widget>[
                _buildTitleAndLogo(),
                _buildRegisterAndLoginButtons(),
                _buildSocialMediaButtons(),
              ],
            )),
      ),
    );
  }

  _buildTitleAndLogo() {
    return Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    _buildPopupMenuLanguageButton(),
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
            AppLocalization.welcomeStart,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  _buildSocialMediaButtons() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(AppLocalization.socialMediaMsg,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: ThisMusicColors.white)),
          SignInButton(
            Buttons.Google,
            text: AppLocalization.googleMsg,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {},
          ),
          SignInButton(
            Buttons.Facebook,
            text: AppLocalization.facebookMsg,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  _buildRegisterAndLoginButtons() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            JRaisedButtonBorder(
              onPressed: () =>
                  Navigator.pushNamed(context, RegisterPage.routerName),
              text: AppLocalization.register,
              color: Color(0xFFD5BD77),
            ),
            SizedBox(height: 5),
            JOutlineButton(
              onPressed: () =>
                  Navigator.pushNamed(context, LoginPage.routerName),
              text: AppLocalization.login,
              color: Color(0xFFD5BD77),
            ),
          ],
        ),
      ),
    );
  }

  _buildPopupMenuLanguageButton() {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      onSelected: (PopLanguageOption selectedLanguage) {
        setState(() {
          if (selectedLanguage == PopLanguageOption.Turkish) {
            ThisMusicAppState.setLang(context, AppLocalization.tr);
          } else if (selectedLanguage == PopLanguageOption.English) {
            ThisMusicAppState.setLang(context, AppLocalization.en);
          } else {
            ThisMusicAppState.setLang(context, AppLocalization.ar);
          }
        });
      },
      icon: Icon(
        Icons.language,
        color: Colors.white,
      ),
      itemBuilder: (_) => [
        PopupMenuItem(
          child: _buildLanguageRow('assets/lang/usa.png', 'English'),
          value: PopLanguageOption.English,
        ),
        PopupMenuItem(
          child: _buildLanguageRow('assets/lang/turkey.png', 'Türkçe'),
          value: PopLanguageOption.Turkish,
        ),
        PopupMenuItem(
          child: _buildLanguageRow('assets/lang/saudi.png', 'العربية'),
          value: PopLanguageOption.Arabic,
        )
      ],
    );
  }

  _buildLanguageRow(String image, String name) {
    return Row(
      children: <Widget>[
        Container(
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
