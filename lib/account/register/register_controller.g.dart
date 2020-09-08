// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  final _$genderAtom = Atom(name: '_RegisterControllerBase.gender');

  @override
  UserGender get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(UserGender value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  final _$loadingAtom = Atom(name: '_RegisterControllerBase.loading');

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

  final _$autoValidateAtom = Atom(name: '_RegisterControllerBase.autoValidate');

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

  final _$langAtom = Atom(name: '_RegisterControllerBase.lang');

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

  final _$showPasswordAtom = Atom(name: '_RegisterControllerBase.showPassword');

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

  final _$selectedGenderAtom =
      Atom(name: '_RegisterControllerBase.selectedGender');

  @override
  UserGender get selectedGender {
    _$selectedGenderAtom.reportRead();
    return super.selectedGender;
  }

  @override
  set selectedGender(UserGender value) {
    _$selectedGenderAtom.reportWrite(value, super.selectedGender, () {
      super.selectedGender = value;
    });
  }

  final _$modelAtom = Atom(name: '_RegisterControllerBase.model');

  @override
  RegisterModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(RegisterModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$datePickerAsyncAction =
      AsyncAction('_RegisterControllerBase.datePicker');

  @override
  Future<dynamic> datePicker(BuildContext context) {
    return _$datePickerAsyncAction.run(() => super.datePicker(context));
  }

  final _$registerAsyncAction = AsyncAction('_RegisterControllerBase.register');

  @override
  Future register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase');

  @override
  bool isRtl() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.isRtl');
    try {
      return super.isRtl();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeViewPassword() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.changeViewPassword');
    try {
      return super.changeViewPassword();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedGenderType(UserGender gender) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setSelectedGenderType');
    try {
      return super.setSelectedGenderType(gender);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String checkFullName() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.checkFullName');
    try {
      return super.checkFullName();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String checkEmail() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.checkEmail');
    try {
      return super.checkEmail();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String checkPassword() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.checkPassword');
    try {
      return super.checkPassword();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String checkUserName() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.checkUserName');
    try {
      return super.checkUserName();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String checkPhoneNumber() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.checkPhoneNumber');
    try {
      return super.checkPhoneNumber();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String checkDateBirth() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.checkDateBirth');
    try {
      return super.checkDateBirth();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gender: ${gender},
loading: ${loading},
autoValidate: ${autoValidate},
lang: ${lang},
showPassword: ${showPassword},
selectedGender: ${selectedGender},
model: ${model}
    ''';
  }
}
