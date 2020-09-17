// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageController on _HomePageControllerBase, Store {
  final _$loadingAtom = Atom(name: '_HomePageControllerBase.loading');

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

  final _$autoValidateAtom = Atom(name: '_HomePageControllerBase.autoValidate');

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

  final _$langAtom = Atom(name: '_HomePageControllerBase.lang');

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

  final _$sliderHomePageAsyncAction =
      AsyncAction('_HomePageControllerBase.sliderHomePage');

  @override
  Future sliderHomePage() {
    return _$sliderHomePageAsyncAction.run(() => super.sliderHomePage());
  }

  final _$lastAlbumsHomePageAsyncAction =
      AsyncAction('_HomePageControllerBase.lastAlbumsHomePage');

  @override
  Future lastAlbumsHomePage() {
    return _$lastAlbumsHomePageAsyncAction
        .run(() => super.lastAlbumsHomePage());
  }

  final _$bestSongsHomePageAsyncAction =
      AsyncAction('_HomePageControllerBase.bestSongsHomePage');

  @override
  Future bestSongsHomePage() {
    return _$bestSongsHomePageAsyncAction.run(() => super.bestSongsHomePage());
  }

  final _$playListHomePageAsyncAction =
      AsyncAction('_HomePageControllerBase.playListHomePage');

  @override
  Future playListHomePage() {
    return _$playListHomePageAsyncAction.run(() => super.playListHomePage());
  }

  final _$_HomePageControllerBaseActionController =
      ActionController(name: '_HomePageControllerBase');

  @override
  bool isRtl() {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.isRtl');
    try {
      return super.isRtl();
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
autoValidate: ${autoValidate},
lang: ${lang}
    ''';
  }
}
