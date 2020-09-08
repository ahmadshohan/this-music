import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:this_music/app_route.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/widgets/closable.dart';
import 'package:this_music/shared/widgets/j_raised_button.dart';
import 'package:this_music/colors.dart';

import 'forgot_password_controller.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  String _forgetPasswordBg = 'assets/jpg/app_bg.jpg';
  String _logo = 'assets/png/welcome_logo.png';
  final ForgotPasswordController _forgotPasswordController =
      ForgotPasswordController();

  void initState() {
    super.initState();
    Future<void>.delayed(Duration(milliseconds: 1000), () async {
      await _forgotPasswordController.init();
    });
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
                    Form(
                      key: _formKey,
                      autovalidate: _forgotPasswordController.autoValidate,
                      child: _buildInputs(),
                    ),
                    Observer(
                      builder: (_) => Visibility(
                        visible: _forgotPasswordController.showTimer,
                        child: Text('${_forgotPasswordController.timer}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.white)),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildSendButton(),
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
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onChanged: (value) => _forgotPasswordController.model.email = value,
        validator: (_) => _forgotPasswordController.checkEmail(),
        onFieldSubmitted: (_) {
          KeyBoard.close(context);
        },
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: AppLocalization.emailMsg,
            fillColor: Colors.white10,
            filled: true,
            labelStyle: TextStyle(color: Colors.white),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10),
            )));
  }

  _buildSendButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: JRaisedButton(
          onPressed: () async {
            KeyBoard.close(context);
            if (_formKey.currentState.validate()) {
              _showSendEmailDialog();
              /*todo handle send email api*/

            } else
              _forgotPasswordController.autoValidate = true;
          },
          text: AppLocalization.send),
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
        onTap: () {
          _forgotPasswordController.resend();
        },
        child: Text(AppLocalization.resend,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: ThisMusicColors.button,
                decoration: TextDecoration.underline)),
      )
    ]);
  }

  _showSendEmailDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
              contentPadding: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              children: <Widget>[
                SizedBox(
                    child: Image.asset('assets/png/sendCase.png',
                        width: 50, height: 50)),
                SizedBox(height: 10),
                Text(AppLocalization.yourRequestSent,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                SizedBox(height: 10),
                SizedBox(
                    height: 40,
                    child: JRaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(
                              context, AppRoute.loginRoute);
                        },
                        text: AppLocalization.continueLabel))
              ]);
        });
  }
}
