// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MusicPlayerController on _MusicPlayerControllerBase, Store {
  final _$loadingAtom = Atom(name: '_MusicPlayerControllerBase.loading');

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

  final _$isFavoriteAtom = Atom(name: '_MusicPlayerControllerBase.isFavorite');

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

  final _$isExpandedAtom = Atom(name: '_MusicPlayerControllerBase.isExpanded');

  @override
  bool get isExpanded {
    _$isExpandedAtom.reportRead();
    return super.isExpanded;
  }

  @override
  set isExpanded(bool value) {
    _$isExpandedAtom.reportWrite(value, super.isExpanded, () {
      super.isExpanded = value;
    });
  }

  final _$_MusicPlayerControllerBaseActionController =
      ActionController(name: '_MusicPlayerControllerBase');

  @override
  void changeViewIsFavourite() {
    final _$actionInfo = _$_MusicPlayerControllerBaseActionController
        .startAction(name: '_MusicPlayerControllerBase.changeViewIsFavourite');
    try {
      return super.changeViewIsFavourite();
    } finally {
      _$_MusicPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIsExpandedView() {
    final _$actionInfo = _$_MusicPlayerControllerBaseActionController
        .startAction(name: '_MusicPlayerControllerBase.changeIsExpandedView');
    try {
      return super.changeIsExpandedView();
    } finally {
      _$_MusicPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
isFavorite: ${isFavorite},
isExpanded: ${isExpanded}
    ''';
  }
}
