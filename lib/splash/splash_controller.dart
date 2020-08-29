import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:this_music/account/welcome/welcome_page.dart';
import 'package:this_music/shared/services/preferences_service.dart';
import 'package:this_music/tab/tab_navigator.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();

  Future init(BuildContext context) async {
    if ((await _preferencesService.token)?.isNotEmpty == true)
      Navigator.pushReplacementNamed(context, TabNavigator.routerName);
    else
      await Future.delayed(
          Duration(milliseconds: 1000),
          () =>
              Navigator.pushReplacementNamed(context, WelcomePage.routerName));
  }
}
