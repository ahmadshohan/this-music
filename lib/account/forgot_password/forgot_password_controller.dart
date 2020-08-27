import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:sprintf/sprintf.dart';
import 'package:this_music/shared/localization/app_localization.dart';

part 'forgot_password_controller.g.dart';

class ForgotPasswordController = _ForgotPasswordControllerBase
    with _$ForgotPasswordController;

abstract class _ForgotPasswordControllerBase with Store {
  Timer _timer;
  int _start = 60;

  _ForgotPasswordControllerBase() {
    _startTimer();
  }

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
  void resend() {
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
