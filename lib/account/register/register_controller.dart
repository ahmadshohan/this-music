import 'package:mobx/mobx.dart';
import 'package:this_music/shared/localization/app_localization.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  @observable
  String lang = AppLocalization.defaultLang;

  @observable
  bool showPassword = false;

  @observable
  int selectedGender = 0;

  @action
  bool isRtl() => lang == AppLocalization.ar;

  @action
  void changeViewPassword() {
    showPassword = !showPassword;
  }

  @action
  void setSelectedGenderType(int value) {
    selectedGender = value;
  }
}
