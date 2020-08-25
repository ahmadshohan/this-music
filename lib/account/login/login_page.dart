import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/widgets/j_raised_button.dart';
import '../forgot_password/forget_password_page.dart';

class LoginPage extends StatefulWidget {
  static const routerName = '/account/login-page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = true;
  bool _rememberMe = false;
  String _loginBg = 'assets/jpg/app_bg.jpg';
  String _logo = 'assets/png/welcome_logo.png';
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

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
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_loginBg),
                fit: BoxFit.fill,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleAndLogo(),
                  SizedBox(height: 70),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ..._buildTitles(),
                        SizedBox(height: 10),
                        ..._buildInputs(),
                        SizedBox(height: 10),
                        _buildActions(),
                        SizedBox(height: 20),
                        _buildLoginButton()
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  _buildTitles() {
    return [
      Text(AppLocalization.login,
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

  _buildInputs() {
    return [
      TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.white),
        textInputAction: TextInputAction.next,
        focusNode: _emailFocusNode,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
        decoration: InputDecoration(
          labelText: AppLocalization.email,
          fillColor: Colors.white10,
          filled: true,
          labelStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10),
          ),
        ),
      ),
      SizedBox(height: 10),
      TextFormField(
          style: TextStyle(color: Colors.white),
          obscureText: _showPassword,
          focusNode: _passwordFocusNode,
          decoration: InputDecoration(
              labelText: AppLocalization.password,
              fillColor: Colors.white10,
              filled: true,
              labelStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.all(16),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                child: Icon(
                  _showPassword ? EvaIcons.eyeOff : EvaIcons.eye,
                  color: Colors.white,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ))),
    ];
  }

  _buildActions() {
    return Row(children: [
      Row(children: [
        Checkbox(
          activeColor: Colors.white,
          checkColor: Colors.black,
          value: _rememberMe,
          onChanged: (value) {
            setState(() {
              _rememberMe = value;
            });
          },
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _rememberMe = !_rememberMe;
            });
          },
          child: Text(
            AppLocalization.rememberMe,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Colors.white,
                ),
          ),
        )
      ]),
      Spacer(),
      GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, ForgotPasswordPage.routerName),
        child: Text(
          AppLocalization.forgotPassword,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
        ),
      )
    ]);
  }

  _buildLoginButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: JRaisedButton(onPressed: () {}, text: AppLocalization.login),
    );
  }
}