import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:this_music/account/login/login_page.dart';
import 'package:this_music/account/register/register_controller.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/model/user_gender.dart';
import 'package:this_music/shared/widgets/closable.dart';
import 'package:this_music/shared/widgets/j_raised_button.dart';
import 'package:this_music/shared/widgets/loader.dart';
import 'package:this_music/tab/tab_navigator.dart';

class RegisterPage extends StatefulWidget {
  static const routerName = '/account/register-page';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _registerBg = 'assets/jpg/app_bg.jpg';
  String _logo = 'assets/png/welcome_logo.png';
  RegisterController _registerController = RegisterController();
  TextEditingController _dateBirth = TextEditingController();
  FocusNode _nameFN = FocusNode();
  FocusNode _telefonNumberFN = FocusNode();
  FocusNode _emailFN = FocusNode();
  FocusNode _passwordFN = FocusNode();
  FocusNode _userNameFN = FocusNode();
  FocusNode _birthFN = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _userNameFN.dispose();
    _birthFN.dispose();
    _emailFN.dispose();
    _nameFN.dispose();
    _passwordFN.dispose();
    _telefonNumberFN.dispose();
  }

  void initState() {
    super.initState();
    Future<void>.delayed(Duration(milliseconds: 1000), () async {
      await _registerController.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Observer(
      builder: (_) => Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_registerBg),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 35,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 30),
                            _buildTitles(),
                            SizedBox(height: 10),
                            Form(
                              key: _formKey,
                              autovalidate: _registerController.autoValidate,
                              child: Column(
                                children: <Widget>[
                                  _buildInputs(),
                                  _buildGenderInput(),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            _buildRegisterButton(),
                            SizedBox(height: 10),
                            _buildHaveAccount(),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          Visibility(
              visible: _registerController.loading,
              child: Center(child: Loader()))
        ],
      ),
    ));
  }

  _buildTitleAndLogo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
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

  _buildTitles() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
        ],
      ),
    );
  }

  _buildInputs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              style: TextStyle(color: Colors.white),
              focusNode: _nameFN,
              onChanged: (value) => _registerController.model.fullName = value,
              validator: (_) => _registerController.checkFullName(),
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(_telefonNumberFN),
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
              focusNode: _telefonNumberFN,
              onChanged: (value) =>
                  _registerController.model.phoneNumber = value,
              validator: (_) => _registerController.checkPhoneNumber(),
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(_emailFN),
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
              onChanged: (value) => _registerController.model.email = value,
              validator: (_) => _registerController.checkEmail(),
              focusNode: _emailFN,
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(_passwordFN),
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
          Observer(
            builder: (_) => TextFormField(
                style: TextStyle(color: Colors.white),
                textInputAction: TextInputAction.next,
                focusNode: _passwordFN,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_userNameFN),
                onChanged: (value) =>
                    _registerController.model.password = value,
                validator: (_) => _registerController.checkPassword(),
                obscureText: !_registerController.showPassword,
                decoration: InputDecoration(
                    labelText: AppLocalization.password,
                    fillColor: Colors.white10,
                    filled: true,
                    labelStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    suffixIcon: GestureDetector(
                      onTap: () => _registerController.changeViewPassword(),
                      child: Icon(_registerController.showPassword
                          ? EvaIcons.eye
                          : EvaIcons.eyeOff),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
          ),
          SizedBox(height: 10),
          TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              focusNode: _userNameFN,
              onFieldSubmitted: (_) => KeyBoard.close(context),
              maxLines: 1,
              style: TextStyle(color: Colors.white),
              onChanged: (value) => _registerController.model.userName = value,
              validator: (_) => _registerController.checkUserName(),
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
            textInputAction: TextInputAction.next,
            focusNode: _birthFN,
            controller: _dateBirth,
            style: TextStyle(color: Colors.white),
            onChanged: (value) => _registerController.model.dateBirth = value,
            // validator: (_) => _registerController.checkdateBirth(),
            decoration: InputDecoration(
              labelText: AppLocalization.dateBirth,
              fillColor: Colors.white10,
              filled: true,
              labelStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10),
              ),
            ),
            onTap: () async {
              KeyBoard.close(context);
              _dateBirth.text = await _registerController.datePicker(context);
            },
          ),
          SizedBox(height: 10),
          Text(
            AppLocalization.gender,
            style: TextStyle(color: ThisMusicColors.white),
          ),
        ],
      ),
    );
  }

  _buildGenderInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Observer(
          builder: (_) => Expanded(
            flex: 1,
            child: Theme(
              data: ThemeData(unselectedWidgetColor: ThisMusicColors.white),
              child: RadioListTile(
                selected: true,
                value: UserGender.Male,
                groupValue: _registerController.selectedGender,
                title: Text(
                  AppLocalization.male,
                  style: TextStyle(color: ThisMusicColors.white, fontSize: 10),
                ),
                activeColor: Colors.blue,
                onChanged: (newValue) {
                  _registerController.setSelectedGenderType(newValue);
                },
              ),
            ),
          ),
        ),
        Observer(
          builder: (_) => Expanded(
            flex: 1,
            child: Theme(
              data: ThemeData(unselectedWidgetColor: ThisMusicColors.white),
              child: RadioListTile(
                onChanged: (newValue) =>
                    _registerController.setSelectedGenderType(newValue),
                value: UserGender.Female,
                groupValue: _registerController.selectedGender,
                title: Text(
                  AppLocalization.female,
                  style: TextStyle(color: ThisMusicColors.white, fontSize: 12),
                ),
                activeColor: Colors.blue,
              ),
            ),
          ),
        ),
        Observer(
          builder: (_) => Expanded(
            flex: 1,
            child: Theme(
              data: ThemeData(unselectedWidgetColor: ThisMusicColors.white),
              child: RadioListTile(
                value: UserGender.Other,
                groupValue: _registerController.selectedGender,
                title: Text(
                  AppLocalization.other,
                  style: TextStyle(color: ThisMusicColors.white, fontSize: 10),
                ),
                activeColor: Colors.blue,
                onChanged: (newValue) {
                  _registerController.setSelectedGenderType(newValue);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildRegisterButton() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: JRaisedButton(
          onPressed: () async {
            KeyBoard.close(context);
            if (_formKey.currentState.validate()) {
              await _registerController.register();
              Navigator.pushReplacementNamed(context, TabNavigator.routerName);
            } else
              _registerController.autoValidate = true;
          },
          text: AppLocalization.register),
    );
  }

  _buildHaveAccount() {
    return Center(
      child: GestureDetector(
        onTap: () =>
            Navigator.pushReplacementNamed(context, LoginPage.routerName),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: AppLocalization.haveAccountMsg,
              style: TextStyle(
                color: ThisMusicColors.white,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            TextSpan(
              text: AppLocalization.login,
              style: TextStyle(
                color: ThisMusicColors.button,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
