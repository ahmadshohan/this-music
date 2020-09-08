import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:this_music/app_route.dart';
import 'package:this_music/shared/services/preferences_service.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();

  Future init(BuildContext context) async {
    if ((await _preferencesService.token)?.isNotEmpty == true)
      Navigator.pushReplacementNamed(context, AppRoute.tabRoute);
    else
      await Future.delayed(Duration(milliseconds: 1000),
          () => Navigator.pushReplacementNamed(context, AppRoute.welcomeRoute));
  }
}
