import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:this_music/music/player/music_player_background_task.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      path: AppLocalization.translationPath,
      fallbackLocale: Locale(AppLocalization.defaultLang),
      child: AudioServiceWidget(child: ThisMusicApp())));
}

void audioPlayerTaskEntryPoint() async {
  AudioServiceBackground.run(() => AudioPlayerTask());
}
