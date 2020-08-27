import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/widgets/j_raised_button.dart';
import 'package:this_music/colors.dart';

import 'forgot_password_controller.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const routerName = '/account/forgot-password';
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String _forgetPasswordBg = 'assets/jpg/app_bg.jpg';
  String _logo = 'assets/png/welcome_logo.png';
  final ForgotPasswordController _forgotPasswordController =
      ForgotPasswordController();
  FocusNode _fieldFN1 = FocusNode();
  FocusNode _fieldFN2 = FocusNode();
  FocusNode _fieldFN3 = FocusNode();
  FocusNode _fieldFN4 = FocusNode();
  @override
  void dispose() {
    super.dispose();
    _fieldFN1.dispose();
    _fieldFN2.dispose();
    _fieldFN3.dispose();
    _fieldFN3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => Container(
            height: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(_forgetPasswordBg), fit: BoxFit.fill)),
            child: SafeArea(
                top: true,
                bottom: true,
                left: false,
                right: false,
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitleAndLogo(),
                    SizedBox(height: 150),
                    ..._buildTitles(),
                    SizedBox(height: 20),
                    _buildInputs(),
                    Observer(
                      builder: (_) => Text('${_forgotPasswordController.timer}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.white)),
                    ),
                    SizedBox(height: 20),
                    _buildVerifyButton(),
                    SizedBox(height: 20),
                    _buildResend()
                  ],
                )))),
      ),
    );
  }

  _buildTitleAndLogo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
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
        ],
      ),
    );
  }

  _buildTitles() {
    return [
      Text(AppLocalization.forgotPassword,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: ThisMusicColors.button)),
      Text(AppLocalization.forgotPasswordMsg,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.white))
    ];
  }

  _buildInputs() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: 50,
            child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                focusNode: _fieldFN1,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_fieldFN2),
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                maxLength: 1,
                decoration: InputDecoration(
                    hintText: '0',
                    counter: Text(''),
                    hintStyle: TextStyle(color: Colors.white38),
                    fillColor: Colors.white10,
                    filled: true,
                    labelStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                    ))),
          ),
          SizedBox(
            width: 50,
            child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                focusNode: _fieldFN2,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_fieldFN3),
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                maxLength: 1,
                decoration: InputDecoration(
                    hintText: '0',
                    counter: Text(''),
                    hintStyle: TextStyle(color: Colors.white38),
                    fillColor: Colors.white10,
                    filled: true,
                    labelStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                    ))),
          ),
          SizedBox(
            width: 50,
            child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                focusNode: _fieldFN3,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_fieldFN4),
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                maxLength: 1,
                decoration: InputDecoration(
                    hintText: '0',
                    counter: Text(''),
                    hintStyle: TextStyle(color: Colors.white38),
                    fillColor: Colors.white10,
                    filled: true,
                    labelStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                    ))),
          ),
          SizedBox(
            width: 50,
            child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                focusNode: _fieldFN4,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                maxLength: 1,
                decoration: InputDecoration(
                    hintText: '0',
                    counter: Text(''),
                    hintStyle: TextStyle(color: Colors.white38),
                    fillColor: Colors.white10,
                    filled: true,
                    labelStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                    ))),
          )
        ]);
  }

  _buildVerifyButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: JRaisedButton(
          onPressed: () {/*Todo handle verifyButton go to home*/},
          text: AppLocalization.verify),
    );
  }

  _buildResend() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(AppLocalization.resendMsg,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.white)),
      SizedBox(width: 10),
      GestureDetector(
        onTap: () => _forgotPasswordController.resend(),
        child: Text(AppLocalization.resend,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: ThisMusicColors.button,
                decoration: TextDecoration.underline)),
      )
    ]);
  }
}
