import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:this_music/data/models/result.dart';
import 'package:this_music/profile/edit_profile/data/models/profile.dart';
import 'package:this_music/profile/edit_profile/data/profile_repository.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/services/preferences_service.dart';
import 'package:this_music/shared/widgets/toaster.dart';

part 'edit_profile_controller.g.dart';

class EditProfileController = _EditProfileControllerBase
    with _$EditProfileController;

abstract class _EditProfileControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();
  ProfileRepository _profileRepository = ProfileRepository();

  Future init() async {
    lang = await _preferencesService.lang;
    AppLocalization.langStream.listen((value) {
      lang = value;
    });
  }

  @observable
  bool loading = false;

  @observable
  String lang = AppLocalization.defaultLang;

  @observable
  File pictureFile;

  @observable
  bool autoValidate = false;

  @observable
  bool showPassword = false;

  @observable
  ProfileModel model = ProfileModel();

  @action
  bool isRtl() => lang == AppLocalization.ar;

  @action
  String checkUserName() {
    if (model.userName.isEmpty) return AppLocalization.userNameRequired;
    if (model.userName.length < 4)
      return AppLocalization.userNameNotValid;
    else
      return null;
  }

  @action
  String checkEmail() {
    if (model.email.isEmpty) return AppLocalization.emailRequired;
    if (EmailValidator.validate(model.email))
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
  String checkPhoneNumber() {
    if (model.phoneNumber.isEmpty) return AppLocalization.phoneNumberRequired;
    if (model.phoneNumber.length < 10)
      return AppLocalization.phoneNumberNotValid;
    else
      return null;
  }

  @action
  void changeViewPassword() {
    showPassword = !showPassword;
  }

  @action
  updateProfilePicture(PickedFile picture) {
    pictureFile = File(picture.path);
  }

  @action
  update() async {
    loading = true;
    final result = await _profileRepository.update(model);
    if (result.state == ResultStatus.FAIL)
      Toaster.error(msg: result.errorMessage);
    else {
      final data = result.data;
    }
    loading = false;
  }
}
