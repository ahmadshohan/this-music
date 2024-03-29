import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shimmer/shimmer.dart';
import 'package:this_music/app_route.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/widgets/closable.dart';
import 'package:this_music/shared/widgets/j_raised_button.dart';
import 'package:this_music/shared/widgets/loader.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _loginController = LoginController();
  final _formKey = GlobalKey<FormState>();
  String _loginBg = 'assets/jpg/app_bg.jpg';
  String _logo = 'assets/png/welcome_logo.png';
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () async {
      await _loginController.init();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => Stack(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10),
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_loginBg),
                    fit: BoxFit.fill,
                  ),
                ),
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
                        SizedBox(height: 70),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ..._buildTitles(),
                              SizedBox(height: 10),
                              Form(
                                  key: _formKey,
                                  autovalidate: _loginController.autoValidate,
                                  child: Column(
                                    children: <Widget>[
                                      ..._buildInputs(),
                                    ],
                                  )),
                              SizedBox(height: 10),
                              _buildActions(),
                              SizedBox(height: 20),
                              _buildLoginButton(),
                              SizedBox(height: 10),
                              _buildDontHaveAccount(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Visibility(
                visible: _loginController.loading,
                child: Center(child: Loader())),
          ],
        ),
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
                    Shimmer.fromColors(
                      baseColor: ThisMusicColors.white,
                      highlightColor: ThisMusicColors.button,
                      enabled: true,
                      child: Image.asset(
                        _logo,
                        height: 80,
                        width: 80,
                      ),
                    ),
                    Shimmer.fromColors(
                      baseColor: ThisMusicColors.white,
                      highlightColor: Colors.grey,
                      enabled: true,
                      child: Text(
                        'THIS MUSIC',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
      ),
    );
  }

  _buildInputs() {
    return [
      TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => _loginController.model.email = value,
        validator: (_) => _loginController.checkEmail(),
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
      Observer(
        builder: (_) => TextFormField(
            style: TextStyle(color: Colors.white),
            obscureText: !_loginController.showPassword,
            focusNode: _passwordFocusNode,
            onChanged: (value) => _loginController.model.password = value,
            validator: (_) => _loginController.checkPassword(),
            decoration: InputDecoration(
                labelText: AppLocalization.password,
                fillColor: Colors.white10,
                filled: true,
                labelStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.all(16),
                suffixIcon: GestureDetector(
                  onTap: () => _loginController.changeViewPassword(),
                  child: Icon(
                    _loginController.showPassword
                        ? EvaIcons.eye
                        : EvaIcons.eyeOff,
                    color: Colors.white,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ))),
      ),
    ];
  }

  _buildActions() {
    return Row(children: [
      Row(children: [
        Theme(
          data: ThemeData(unselectedWidgetColor: ThisMusicColors.white),
          child: Observer(
            builder: (_) => Checkbox(
              activeColor: Colors.white,
              checkColor: Colors.black,
              value: _loginController.rememberMe,
              onChanged: (value) => _loginController.changeRememberMe(),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _loginController.changeRememberMe(),
          child: Text(
            AppLocalization.rememberMe,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.white, fontSize: 12),
          ),
        )
      ]),
      Spacer(),
      GestureDetector(
        // onTap: () {},
        onTap: () {
          Navigator.pushNamed(context, AppRoute.forgotPasswordRoute);
        },
        child: Text(
          AppLocalization.forgotPassword,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.white,
                fontSize: 12,
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
        child: JRaisedButton(
            onPressed: () async {
              KeyBoard.close(context);
              if (_formKey.currentState.validate()) {
                await _loginController.login(context);
              } else
                _loginController.autoValidate = true;
            },
            text: AppLocalization.login));
  }

  _buildDontHaveAccount() {
    return Center(
        child: GestureDetector(
            onTap: () =>
                Navigator.pushReplacementNamed(context, AppRoute.registerRoute),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: AppLocalization.noAccountMsg,
                  style: TextStyle(
                      color: ThisMusicColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17)),
              TextSpan(
                  text: AppLocalization.register,
                  style: TextStyle(
                    color: ThisMusicColors.button,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ))
            ]))));
  }
}
