import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:easy_localization/easy_localization.dart';
import '../services/preferences_service.dart';

class AppLocalization {
  static const ar = 'ar';
  static const en = 'en';
  static const tr = 'tr';
  static const defaultLang = tr;
  static String currentLang = en;
  static PreferencesService _preferencesService = PreferencesService();
  static BehaviorSubject<String> langStream = new BehaviorSubject();

  static get translationPath {
    return 'assets/translations';
  }

  static get supportedLocales {
    return [
      Locale(tr),
      Locale(en),
      Locale(ar),
    ];
  }

  static setLang(BuildContext context, String lang) {
    currentLang = lang;
    context.locale = Locale(lang);
    _preferencesService.lang = lang;
    langStream.value = lang;
  }

  static get(String label, {List<String> args}) {
    if (args != null && args.isNotEmpty) {
      for (var i = 0; i < args.length; ++i) {
        label = label.tr().replaceAll("{$i}", args[i]);
      }
    }
    return label.tr();
  }

  static get welcomeStart => 'welcomeStart'.tr();
  static get registerStart => 'registerStart'.tr();
  static get lorem => 'lorem'.tr();
  static get loremLarge => 'loremLarge'.tr();

  static get register => 'register'.tr();
  static get login => 'login'.tr();
  static get loginMsg => 'loginMsg'.tr();
  static get socialMediaMsg => 'socialMediaMsg'.tr();
  static get googleMsg => 'googleMsg'.tr();
  static get facebookMsg => 'facebookMsg'.tr();

  static get facebook => 'facebook'.tr();
  static get google => 'google'.tr();
  static get apple => 'apple'.tr();
  static get email => 'email'.tr();
  static get password => 'password'.tr();
  static get rememberMe => 'rememberMe'.tr();
  static get forgotPassword => 'forgotPassword'.tr();
  static get forgotPasswordMsg => 'forgotPasswordMsg'.tr();
  static get name => 'name'.tr();
  static get userName => 'userName'.tr();
  static get dateBirth => 'dateBirth'.tr();
  static get phoneNumber => 'phoneNumber'.tr();
  static get gender => 'gender'.tr();
  static get male => 'male'.tr();
  static get female => 'female'.tr();
  static get other => 'other'.tr();
  static get haveAccountMsg => 'haveAccountMsg'.tr();
  static get noAccountMsg => 'noAccountMsg'.tr();

  static get idNumber => 'idNumber'.tr();
  static get verify => 'verify'.tr();
  static get resend => 'resend'.tr();
  static get resendMsg => 'resendMsg'.tr();
  static get hello => 'hello'.tr();
}
