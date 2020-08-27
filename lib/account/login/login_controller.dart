import 'package:mobx/mobx.dart';
import 'package:this_music/shared/localization/app_localization.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  bool rememberMe = false;

  @observable
  bool showPassword = false;

  @observable
  String lang = AppLocalization.defaultLang;

  @action
  bool isRtl() => lang == AppLocalization.ar;

  @action
  void changeRememberMe() {
    rememberMe = !rememberMe;
  }

  @action
  void changeViewPassword() {
    showPassword = !showPassword;
  }
}
