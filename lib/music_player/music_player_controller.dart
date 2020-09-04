import 'package:mobx/mobx.dart';

part 'music_player_controller.g.dart';

class MusicPlayerController = _MusicPlayerControllerBase
    with _$MusicPlayerController;

abstract class _MusicPlayerControllerBase with Store {}
