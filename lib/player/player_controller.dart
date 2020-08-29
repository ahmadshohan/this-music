import 'package:mobx/mobx.dart';
import 'package:this_music/shared/localization/app_localization.dart';

part 'player_controller.g.dart';

class PlayerController = _PlayerControllerBase with _$PlayerController;

abstract class _PlayerControllerBase with Store {}
