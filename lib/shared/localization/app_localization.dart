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
  static get emailMsg => 'emailMsg'.tr();
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
  static get menu => 'menu'.tr();
  static get search => "search".tr();
  static get radio => "radio".tr();
  static get haveAccountMsg => 'haveAccountMsg'.tr();
  static get noAccountMsg => 'noAccountMsg'.tr();
  static get bestAlbumsWeeklyMsg => 'bestAlbumsWeeklyMsg'.tr();
  static get specialAlbumsUserMsg => 'specialAlbumsUserMsg'.tr();
  static get specialPlaylistUserMsg => 'specialPlaylistUserMsg'.tr();

  static get idNumber => 'idNumber'.tr();

  static get someError => 'someError'.tr();
  static get emailRequired => 'emailRequired'.tr();
  static get emailNotValid => 'emailNotValid'.tr();
  static get passwordRequired => 'passwordRequired'.tr();
  static get passwordNotValid => 'passwordNotValid'.tr();
  static get userNameRequired => 'userNameRequired'.tr();
  static get userNameNotValid => 'userNameNotValid'.tr();
  static get phoneNumberRequired => 'phoneNumberRequired'.tr();
  static get phoneNumberNotValid => 'phoneNumberNotValid'.tr();
  static get idNumberRequired => 'idNumberRequired'.tr();
  static get degreeRequired => 'degreeRequired'.tr();

  static get linkedAccount => 'linkedAccount'.tr();
  static get changeLanguage => 'changeLanguage'.tr();
  static get textMessage => 'textMessage'.tr();
  static get settings => 'settings'.tr();
  static get update => 'update'.tr();
  static get language => 'language'.tr();
  static get currancy => 'currancy'.tr();
  static get phoneCalls => 'phoneCalls'.tr();
  static get accountManagement => 'accountManagement'.tr();
  static get soundSettings => 'soundSettings'.tr();
  static get offlineMode => 'offlineMode'.tr();
  static get applicationEvaluation => 'applicationEvaluation'.tr();
  static get aboutUs => 'aboutUs'.tr();

  static get searchSuggest => "searchSuggest".tr();
  static get types => "types".tr();
  static get moodActivities => "moodActivities".tr();

  static get verify => 'verify'.tr();
  static get resend => 'resend'.tr();
  static get send => 'send'.tr();
  static get resendMsg => 'resendMsg'.tr();
  static get hello => 'hello'.tr();

  static get share => 'share'.tr();
  static get favorite => 'favorite'.tr();

  static get profile => 'profile'.tr();
  static get personalInformation => 'personalInformation'.tr();
  static get yourName => 'yourName'.tr();
  static get editInformations => 'editInformations'.tr();

  static get yourRequestSent => 'yourRequestSent'.tr();
  static get yourRequestSentMsg => 'yourRequestSentMsg'.tr();
  static get continueLabel => 'continue'.tr();

  static get versionNumber => 'versionNumber'.tr();
  static get termsConditions => 'termsConditions'.tr();

  static get logout => 'logout'.tr();
}
