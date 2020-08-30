import 'package:mobx/mobx.dart';
import 'package:this_music/shared/localization/app_localization.dart';

part 'music_player_controller.g.dart';

class MusicPlayerController = _MusicPlayerControllerBase
    with _$MusicPlayerController;

abstract class _MusicPlayerControllerBase with Store {}
