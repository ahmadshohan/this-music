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

part 'welcome_page_controller.g.dart';

class WelcomeController = _WelcomeControllerBase with _$WelcomeController;

abstract class _WelcomeControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();
  AccountRepository _accountRepository = AccountRepository();

  Future _init() async {
    lang = await _preferencesService.lang;
    AppLocalization.langStream.listen((value) {
      lang = value;
    });
  }

  @observable
  bool loading = false;


  @observable
  String lang = AppLocalization.defaultLang;

  @action
  bool isRtl() => lang == AppLocalization.ar;



  @action
  googleLogin() async {
    loading = true;
    final result = await _accountRepository.googleSignIn();
    if (result.state == ResultStatus.SUCCESS) {
      final data = result.data as LoginResult;
      _preferencesService.token = data.token;
      _preferencesService.user = jsonEncode(data.user);
    }
    loading = false;
  }

  @action
  facebookLogin() async {
    loading = true;
    // final result = await _accountRepository.facebookSignIn(gender);
    // if (result.state == ResultStatus.SUCCESS) {
    //   final data = result.data as LoginResult;
    //   _preferencesService.token = data.token;
    //   _preferencesService.user = jsonEncode(data.user);
    // }
    // loading = false;
  }
}
