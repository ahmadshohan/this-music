// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotPasswordController on _ForgotPasswordControllerBase, Store {
  final _$loadingAtom = Atom(name: '_ForgotPasswordControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$autoValidateAtom =
      Atom(name: '_ForgotPasswordControllerBase.autoValidate');

  @override
  bool get autoValidate {
    _$autoValidateAtom.reportRead();
    return super.autoValidate;
  }

  @override
  set autoValidate(bool value) {
    _$autoValidateAtom.reportWrite(value, super.autoValidate, () {
      super.autoValidate = value;
    });
  }

  final _$showTimerAtom = Atom(name: '_ForgotPasswordControllerBase.showTimer');

  @override
  bool get showTimer {
    _$showTimerAtom.reportRead();
    return super.showTimer;
  }

  @override
  set showTimer(bool value) {
    _$showTimerAtom.reportWrite(value, super.showTimer, () {
      super.showTimer = value;
    });
  }

  final _$modelAtom = Atom(name: '_ForgotPasswordControllerBase.model');

  @override
  ForgotPasswordModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(ForgotPasswordModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$timerAtom = Atom(name: '_ForgotPasswordControllerBase.timer');

  @override
  String get timer {
    _$timerAtom.reportRead();
    return super.timer;
  }

  @override
  set timer(String value) {
    _$timerAtom.reportWrite(value, super.timer, () {
      super.timer = value;
    });
  }

  final _$rememberMeAtom =
      Atom(name: '_ForgotPasswordControllerBase.rememberMe');

  @override
  bool get rememberMe {
    _$rememberMeAtom.reportRead();
    return super.rememberMe;
  }

  @override
  set rememberMe(bool value) {
    _$rememberMeAtom.reportWrite(value, super.rememberMe, () {
      super.rememberMe = value;
    });
  }

  final _$showPasswordAtom =
      Atom(name: '_ForgotPasswordControllerBase.showPassword');

  @override
  bool get showPassword {
    _$showPasswordAtom.reportRead();
    return super.showPassword;
  }

  @override
  set showPassword(bool value) {
    _$showPasswordAtom.reportWrite(value, super.showPassword, () {
      super.showPassword = value;
    });
  }

  final _$langAtom = Atom(name: '_ForgotPasswordControllerBase.lang');

  @override
  String get lang {
    _$langAtom.reportRead();
    return super.lang;
  }

  @override
  set lang(String value) {
    _$langAtom.reportWrite(value, super.lang, () {
      super.lang = value;
    });
  }

  final _$forgotPasswordAsyncAction =
      AsyncAction('_ForgotPasswordControllerBase.forgotPassword');

  @override
  Future forgotPassword(BuildContext context) {
    return _$forgotPasswordAsyncAction.run(() => super.forgotPassword(context));
  }

  final _$_ForgotPasswordControllerBaseActionController =
      ActionController(name: '_ForgotPasswordControllerBase');

  @override
  bool isRtl() {
    final _$actionInfo = _$_ForgotPasswordControllerBaseActionController
        .startAction(name: '_ForgotPasswordControllerBase.isRtl');
    try {
      return super.isRtl();
    } finally {
      _$_ForgotPasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeRememberMe() {
    final _$actionInfo = _$_ForgotPasswordControllerBaseActionController
        .startAction(name: '_ForgotPasswordControllerBase.changeRememberMe');
    try {
      return super.changeRememberMe();
    } finally {
      _$_ForgotPasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeViewPassword() {
    final _$actionInfo = _$_ForgotPasswordControllerBaseActionController
        .startAction(name: '_ForgotPasswordControllerBase.changeViewPassword');
    try {
      return super.changeViewPassword();
    } finally {
      _$_ForgotPasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String checkEmail() {
    final _$actionInfo = _$_ForgotPasswordControllerBaseActionController
        .startAction(name: '_ForgotPasswordControllerBase.checkEmail');
    try {
      return super.checkEmail();
    } finally {
      _$_ForgotPasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resend() {
    final _$actionInfo = _$_ForgotPasswordControllerBaseActionController
        .startAction(name: '_ForgotPasswordControllerBase.resend');
    try {
      return super.resend();
    } finally {
      _$_ForgotPasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
autoValidate: ${autoValidate},
showTimer: ${showTimer},
model: ${model},
timer: ${timer},
rememberMe: ${rememberMe},
showPassword: ${showPassword},
lang: ${lang}
    ''';
  }
}
