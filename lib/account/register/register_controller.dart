import 'dart:convert';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:this_music/account/data/account_repository.dart';
import 'package:this_music/account/data/models/login.dart';
import 'package:this_music/account/data/models/register.dart';
import 'package:this_music/app_route.dart';
import 'package:this_music/data/models/result.dart';
import 'package:this_music/data/models/user.dart';
import 'package:this_music/data_picker.dart';
import 'package:this_music/shared/constant/user_gender.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/services/preferences_service.dart';
import 'package:this_music/shared/widgets/toaster.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();
  AccountRepository _accountRepository = AccountRepository();

  Future init() async {
    autoValidate = false;
    lang = await _preferencesService.lang;
    model.genderType = UserGender.Male.toString();
    AppLocalization.langStream.listen((value) {
      lang = value;
    });
  }

  @observable
  UserGender gender = UserGender.Male;

  @observable
  bool loading = false;
  @observable
  bool autoValidate = false;

  @observable
  String lang = AppLocalization.defaultLang;

  @observable
  bool showPassword = false;

  @observable
  UserGender selectedGender = UserGender.Male;

  @observable
  RegisterModel model = RegisterModel();

  @action
  bool isRtl() => lang == AppLocalization.ar;

  @action
  void changeViewPassword() {
    showPassword = !showPassword;
  }

  @action
  void setSelectedGenderType(UserGender gender) {
    selectedGender = gender;
    model.genderType = gender.toString();
  }

  @action
  String checkFullName() {
    if (model.fullName.isEmpty) return AppLocalization.userNameRequired;
    if (model.fullName.length < 4)
      return AppLocalization.userNameNotValid;
    else
      return null;
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
  String checkPassword() {
    if (model.password.isEmpty) return AppLocalization.passwordRequired;
    if (model.password.length < 6 || model.password.length > 30)
      return AppLocalization.passwordNotValid;
    else
      return null;
  }

  @action
  String checkUserName() {
    if (model.userName.isEmpty) return AppLocalization.userNameRequired;
    if (model.userName.length < 4)
      return AppLocalization.userNameNotValid;
    else
      return null;
  }

  @action
  String checkPhoneNumber() {
    if (model.phoneNumber.isEmpty) return AppLocalization.phoneNumberRequired;
    if (model.phoneNumber.length < 11)
      return AppLocalization.phoneNumberNotValid;
    else
      return null;
  }

  @action
  String checkDateBirth() {
    if (model.dateBirth.isEmpty) return AppLocalization.dateBirth;
    if (model.dateBirth.length < 6)
      return AppLocalization.dateBirth;
    else
      return null;
  }

  @action
  Future datePicker(BuildContext context) async {
    DateTime date = DateTime(1900);
    date = Platform.isIOS
        ? await DatePicker().showIosDatePicker(context)
        : await DatePicker().showAndroidDatePicker(context);
    String dateBirth = DateFormat('dd-MM-yyyy').format(date);
    model.dateBirth = dateBirth;
    return dateBirth;
  }

  @action
  register(BuildContext context) async {
    loading = true;
    final result = await _accountRepository.register(model);
    if (result.state == ResultStatus.FAIL)
      Toaster.error(msg: result.errorMessage);
    else {
      final data = result.data as LoginResult;
      _preferencesService.token = data.response.token;
      // var a = await _preferencesService.token;
      _preferencesService.user = jsonEncode(data.user);
      // var b = User.fromJson(jsonDecode(await _preferencesService.user));
      Navigator.pushReplacementNamed(context, AppRoute.mainRoute);
    }
    loading = false;
  }
}
