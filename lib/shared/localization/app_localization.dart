import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AppLocalization {
  static const ar = 'ar';
  static const en = 'en';
  static const tr = 'tr';
  static const defaultLang = tr;
  static String currentLang = en;

  static get translationPath {
    return 'assets/translations';
  }

  static get supportedLocales {
    return [
      Locale(ar),
      Locale(en),
      Locale(tr),
    ];
  }

  static get lorem => 'lorem'.tr();
  static get loremLarge => 'loremLarge'.tr();

  static get student => 'student'.tr();
  static get register => 'register'.tr();
  static get login => 'login'.tr();
  static get loginMsg => 'loginMsg'.tr();
  static get socialMediaMsg => 'socialMediaMsg'.tr();
  static get facebook => 'facebook'.tr();
  static get google => 'google'.tr();
  static get apple => 'apple'.tr();
  static get email => 'email'.tr();
  static get password => 'password'.tr();
  static get rememberMe => 'rememberMe'.tr();
  static get forgotPassword => 'forgotPassword'.tr();
  static get forgotPasswordMsg => 'forgotPasswordMsg'.tr();
  static get name => 'name'.tr();
  static get phoneNumber => 'phoneNumber'.tr();
  static get idNumber => 'idNumber'.tr();
  static get verify => 'verify'.tr();
  static get resend => 'resend'.tr();
  static get resendMsg => 'resendMsg'.tr();
  static get hello => 'hello'.tr();
}
