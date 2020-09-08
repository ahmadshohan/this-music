// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsController on _SettingsControllerBase, Store {
  final _$loadingAtom = Atom(name: '_SettingsControllerBase.loading');

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

  final _$langAtom = Atom(name: '_SettingsControllerBase.lang');

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

  final _$logoutAsyncAction = AsyncAction('_SettingsControllerBase.logout');

  @override
  Future logout(BuildContext context) {
    return _$logoutAsyncAction.run(() => super.logout(context));
  }

  final _$_SettingsControllerBaseActionController =
      ActionController(name: '_SettingsControllerBase');

  @override
  String getCurrentLang() {
    final _$actionInfo = _$_SettingsControllerBaseActionController.startAction(
        name: '_SettingsControllerBase.getCurrentLang');
    try {
      return super.getCurrentLang();
    } finally {
      _$_SettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentLang(BuildContext context, String lang) {
    final _$actionInfo = _$_SettingsControllerBaseActionController.startAction(
        name: '_SettingsControllerBase.setCurrentLang');
    try {
      return super.setCurrentLang(context, lang);
    } finally {
      _$_SettingsControllerBaseActionController.endAction(_$actionInfo);
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
