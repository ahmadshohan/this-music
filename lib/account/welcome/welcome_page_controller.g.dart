// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WelcomeController on _WelcomeControllerBase, Store {
  final _$loadingAtom = Atom(name: '_WelcomeControllerBase.loading');

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

  final _$langAtom = Atom(name: '_WelcomeControllerBase.lang');

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

  final _$googleLoginAsyncAction =
      AsyncAction('_WelcomeControllerBase.googleLogin');

  @override
  Future googleLogin(BuildContext context) {
    return _$googleLoginAsyncAction.run(() => super.googleLogin(context));
  }

  final _$facebookLoginAsyncAction =
      AsyncAction('_WelcomeControllerBase.facebookLogin');

  @override
  Future facebookLogin(BuildContext context) {
    return _$facebookLoginAsyncAction.run(() => super.facebookLogin(context));
  }

  final _$_WelcomeControllerBaseActionController =
      ActionController(name: '_WelcomeControllerBase');

  @override
  bool isRtl() {
    final _$actionInfo = _$_WelcomeControllerBaseActionController.startAction(
        name: '_WelcomeControllerBase.isRtl');
    try {
      return super.isRtl();
    } finally {
      _$_WelcomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
lang: ${lang}
    ''';
  }
}
