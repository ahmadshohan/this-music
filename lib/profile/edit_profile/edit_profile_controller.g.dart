// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditProfileController on _EditProfileControllerBase, Store {
  final _$loadingAtom = Atom(name: '_EditProfileControllerBase.loading');

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

  final _$langAtom = Atom(name: '_EditProfileControllerBase.lang');

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

  final _$pictureFileAtom =
      Atom(name: '_EditProfileControllerBase.pictureFile');

  @override
  File get pictureFile {
    _$pictureFileAtom.reportRead();
    return super.pictureFile;
  }

  @override
  set pictureFile(File value) {
    _$pictureFileAtom.reportWrite(value, super.pictureFile, () {
      super.pictureFile = value;
    });
  }

  final _$autoValidateAtom =
      Atom(name: '_EditProfileControllerBase.autoValidate');

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

  final _$showPasswordAtom =
      Atom(name: '_EditProfileControllerBase.showPassword');

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

  final _$modelAtom = Atom(name: '_EditProfileControllerBase.model');

  @override
  ProfileModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(ProfileModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$updateAsyncAction = AsyncAction('_EditProfileControllerBase.update');

  @override
  Future update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  final _$_EditProfileControllerBaseActionController =
      ActionController(name: '_EditProfileControllerBase');

  @override
  bool isRtl() {
    final _$actionInfo = _$_EditProfileControllerBaseActionController
        .startAction(name: '_EditProfileControllerBase.isRtl');
    try {
      return super.isRtl();
    } finally {
      _$_EditProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String checkUserName() {
    final _$actionInfo = _$_EditProfileControllerBaseActionController
        .startAction(name: '_EditProfileControllerBase.checkUserName');
    try {
      return super.checkUserName();
    } finally {
      _$_EditProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String checkEmail() {
    final _$actionInfo = _$_EditProfileControllerBaseActionController
        .startAction(name: '_EditProfileControllerBase.checkEmail');
    try {
      return super.checkEmail();
    } finally {
      _$_EditProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String checkPassword() {
    final _$actionInfo = _$_EditProfileControllerBaseActionController
        .startAction(name: '_EditProfileControllerBase.checkPassword');
    try {
      return super.checkPassword();
    } finally {
      _$_EditProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String checkPhoneNumber() {
    final _$actionInfo = _$_EditProfileControllerBaseActionController
        .startAction(name: '_EditProfileControllerBase.checkPhoneNumber');
    try {
      return super.checkPhoneNumber();
    } finally {
      _$_EditProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeViewPassword() {
    final _$actionInfo = _$_EditProfileControllerBaseActionController
        .startAction(name: '_EditProfileControllerBase.changeViewPassword');
    try {
      return super.changeViewPassword();
    } finally {
      _$_EditProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateProfilePicture(PickedFile picture) {
    final _$actionInfo = _$_EditProfileControllerBaseActionController
        .startAction(name: '_EditProfileControllerBase.updateProfilePicture');
    try {
      return super.updateProfilePicture(picture);
    } finally {
      _$_EditProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
lang: ${lang},
pictureFile: ${pictureFile},
autoValidate: ${autoValidate},
showPassword: ${showPassword},
model: ${model}
    ''';
  }
}
