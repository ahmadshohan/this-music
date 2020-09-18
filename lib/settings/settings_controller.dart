import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:this_music/account/data/account_repository.dart';
import 'package:this_music/app_route.dart';
import 'package:this_music/app_widget.dart';
import 'package:this_music/data/models/result.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/services/preferences_service.dart';
import 'package:this_music/shared/widgets/toaster.dart';

part 'settings_controller.g.dart';

class SettingsController = _SettingsControllerBase with _$SettingsController;

abstract class _SettingsControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();
  AccountRepository _accountRepository = AccountRepository();

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

  @action
  String getCurrentLang() {
    switch (lang) {
      case AppLocalization.ar:
        return 'العربية';
        break;
      case AppLocalization.tr:
        return 'Türk';
        break;
      default:
        return 'English';
        break;
    }
  }

  @action
  void setCurrentLang(BuildContext context, String lang) {
    ThisMusicAppState.setLang(context, lang);
  }

  @action
  logout(BuildContext context) async {
    loading = true;
    final result = await _accountRepository.logout();
    if (result.state == ResultStatus.FAIL)
      Toaster.error(msg: result.errorMessage);
    else {
      _preferencesService.user = null;
      _preferencesService.token = null;
      Navigator.of(context).pushReplacementNamed(AppRoute.welcomeRoute);
    }
    loading = false;
  }
}
