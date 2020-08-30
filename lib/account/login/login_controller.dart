import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:this_music/account/data/account_repository.dart';
import 'package:this_music/account/data/models/login.dart';
import 'package:this_music/data/models/result.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/services/preferences_service.dart';
import 'package:this_music/shared/widgets/toaster.dart';
import 'package:this_music/tab/tab_navigator.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();
  AccountRepository _accountRepository = AccountRepository();

  @observable
  bool rememberMe = false;

  @observable
  bool showPassword = false;
  @observable
  bool loading = false;

  @observable
  bool autoValidate = false;

  @observable
  String lang = AppLocalization.defaultLang;

  @action
  bool isRtl() => lang == AppLocalization.ar;

  @action
  void changeRememberMe() {
    rememberMe = !rememberMe;
  }

  Future init() async {
    autoValidate = false;
    lang = await _preferencesService.lang;
    AppLocalization.langStream.listen((value) {
      lang = value;
    });
  }

  @observable
  LoginModel model = LoginModel();

  @action
  String checkEmail() {
    if (model.email.isEmpty)
      return AppLocalization.emailRequired;
    else if (EmailValidator.validate(model.email))
      return null;
    else
      return AppLocalization.emailNotValid;
  }

  @action
  String checkPassword() {
    if (model.password.isEmpty) return AppLocalization.passwordRequired;
    if (model.password.length < 6 || model.password.length > 30)
      AppLocalization.passwordNotValid;
    else
      return null;
  }

  @action
  login(BuildContext context) async {
    loading = true;
    final result = await _accountRepository.login(model);
    if (result.state == ResultStatus.FAIL)
      Toaster.error(msg: result.errorMessage);
    else {
      final data = result.data as LoginResult;
      _preferencesService.token = data.token;
      _preferencesService.user = jsonEncode(data.user);
      Navigator.pushReplacementNamed(context, TabNavigator.routerName);
    }
    loading = false;
  }

  @action
  void changeViewPassword() {
    showPassword = !showPassword;
  }
}
