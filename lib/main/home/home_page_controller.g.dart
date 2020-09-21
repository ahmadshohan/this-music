// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageController on _HomePageControllerBase, Store {
  final _$sliderDataAtom = Atom(name: '_HomePageControllerBase.sliderData');

  @override
  List<Slider> get sliderData {
    _$sliderDataAtom.reportRead();
    return super.sliderData;
  }

  @override
  set sliderData(List<Slider> value) {
    _$sliderDataAtom.reportWrite(value, super.sliderData, () {
      super.sliderData = value;
    });
  }

  final _$lastAlbumsDataAtom =
      Atom(name: '_HomePageControllerBase.lastAlbumsData');

  @override
  List<Album> get lastAlbumsData {
    _$lastAlbumsDataAtom.reportRead();
    return super.lastAlbumsData;
  }

  @override
  set lastAlbumsData(List<Album> value) {
    _$lastAlbumsDataAtom.reportWrite(value, super.lastAlbumsData, () {
      super.lastAlbumsData = value;
    });
  }

  final _$bestSongsDataAtom =
      Atom(name: '_HomePageControllerBase.bestSongsData');

  @override
  List<Song> get bestSongsData {
    _$bestSongsDataAtom.reportRead();
    return super.bestSongsData;
  }

  @override
  set bestSongsData(List<Song> value) {
    _$bestSongsDataAtom.reportWrite(value, super.bestSongsData, () {
      super.bestSongsData = value;
    });
  }

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

  final _$isFavoriteAtom = Atom(name: '_HomePageControllerBase.isFavorite');

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
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

  final _$initAsyncAction = AsyncAction('_HomePageControllerBase.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$sliderHomePageAsyncAction =
      AsyncAction('_HomePageControllerBase.sliderHomePage');

  @override
  Future<List<Slider>> sliderHomePage() {
    return _$sliderHomePageAsyncAction.run(() => super.sliderHomePage());
  }

  final _$lastAlbumsHomePageAsyncAction =
      AsyncAction('_HomePageControllerBase.lastAlbumsHomePage');

  @override
  Future<List<Album>> lastAlbumsHomePage() {
    return _$lastAlbumsHomePageAsyncAction
        .run(() => super.lastAlbumsHomePage());
  }

  final _$bestSongsHomePageAsyncAction =
      AsyncAction('_HomePageControllerBase.bestSongsHomePage');

  @override
  Future<List<Song>> bestSongsHomePage() {
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
sliderData: ${sliderData},
lastAlbumsData: ${lastAlbumsData},
bestSongsData: ${bestSongsData},
loading: ${loading},
isFavorite: ${isFavorite},
autoValidate: ${autoValidate},
lang: ${lang}
    ''';
  }
}
