import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:mobx/mobx.dart';
import 'package:sprintf/sprintf.dart';
import 'package:this_music/account/data/models/forgotPassword.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/services/preferences_service.dart';

part 'forgot_password_controller.g.dart';

class ForgotPasswordController = _ForgotPasswordControllerBase
    with _$ForgotPasswordController;

abstract class _ForgotPasswordControllerBase with Store {
  Timer _timer;
  int _start = 60;
  PreferencesService _preferencesService = PreferencesService();

  _ForgotPasswordControllerBase() {
    _startTimer();
  }

  Future init() async {
    autoValidate = false;
    lang = await _preferencesService.lang;
    AppLocalization.langStream.listen((value) {
      lang = value;
    });
  }

  @observable
  bool autoValidate = false;

  @observable
  bool showTimer = false;

  @observable
  ForgotPasswordModel model = ForgotPasswordModel();

  @observable
  String timer = '01:00';

  @observable
  bool rememberMe = false;

  @observable
  bool showPassword = false;

  @observable
  String lang = AppLocalization.defaultLang;

  @action
  bool isRtl() => lang == AppLocalization.ar;

  @action
  void changeRememberMe() {
    rememberMe = !rememberMe;
  }

  @action
  void changeViewPassword() {
    showPassword = !showPassword;
  }

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
  void resend() {
    showTimer = true;
    _start = 60;
    timer = '01:00';
    _timer?.cancel();
    _startTimer();
  }

  void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (Timer t) {
      if (_start <= 1) {
        t.cancel();
        timer = '00:00';
      } else {
        _start = _start - 1;
        timer = '00:${sprintf("%02i", [_start])}';
      }
    });
  }
}
