import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:this_music/account/login/login_page.dart';
import 'package:this_music/account/register/register_page.dart';
import 'package:this_music/app_widget.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/services/preferences_service.dart';
import 'package:this_music/shared/widgets/j_outline_button.dart';
import 'package:this_music/shared/widgets/j_raised_buttonborder.dart';
import 'package:this_music/shared/widgets/loader.dart';
import 'package:this_music/account/welcome/welcome_page_controller.dart';

enum PopLanguageOption { Turkish, English, Arabic }

class WelcomePage extends StatefulWidget {
  static const routerName = '/account.welcome-page';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  WelcomeController _welcomeController = WelcomeController();
  String _welcomeBg = 'assets/jpg/app_bg.jpg';
  String _logo = 'assets/png/welcome_logo.png';
  PreferencesService _preferencesService = PreferencesService();
  String _selectedLang = 'TR';
  static Locale locale;
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(Duration(milliseconds: 1000), () async {
      setState(() async {
        _selectedLang = await _preferencesService.lang;
        AppLocalization.setLang(context, _selectedLang);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => Stack(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_welcomeBg),
                    fit: BoxFit.fill,
                  ),
                ),
                child: SafeArea(
                  top: true,
                  bottom: true,
                  right: false,
                  left: false,
                  child: Column(
                    children: <Widget>[
                      _buildTitleAndLogo(),
                      _buildRegisterAndLoginButtons(),
                      _buildSocialMediaButtons(),
                    ],
                  ),
                )),
            Visibility(
                visible: _welcomeController.loading,
                child: Center(child: Loader())),
          ],
        ),
      ),
    );
  }

  _buildTitleAndLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
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
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(AppLocalization.socialMediaMsg,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: ThisMusicColors.white)),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: SignInButton(
              Buttons.Google,
              text: AppLocalization.googleMsg,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () => _welcomeController.googleLogin(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: SignInButton(
              Buttons.Facebook,
              text: AppLocalization.facebookMsg,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                //TODO handle login with facebook
                _welcomeController.facebookLogin();
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildRegisterAndLoginButtons() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: 50,
              child: JRaisedButtonBorder(
                onPressed: () {
                  Navigator.pushNamed(context, RegisterPage.routerName);
                },
                text: AppLocalization.register,
                color: Color(0xFFD5BD77),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: JOutlineButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.routerName);
                },
                text: AppLocalization.login,
                color: Color(0xFFD5BD77),
              ),
            )
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
            setState(() {
              _selectedLang = 'TR';
            });
          } else if (selectedLanguage == PopLanguageOption.English) {
            ThisMusicAppState.setLang(context, AppLocalization.en);
            setState(() {
              _selectedLang = 'EN';
            });
          } else {
            ThisMusicAppState.setLang(context, AppLocalization.ar);
            setState(() {
              _selectedLang = 'AR';
            });
          }
        });
      },
      icon: Container(
        width: 30,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.white, width: 2)),
        child: Text(
          _selectedLang,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
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
