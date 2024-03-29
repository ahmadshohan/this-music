import 'package:mobx/mobx.dart';
import 'package:this_music/data/models/result.dart';
import 'package:this_music/main/data/homepage_repository.dart';
import 'package:this_music/main/data/models/album.dart';
import 'package:this_music/main/data/models/slider.dart';
import 'package:this_music/main/data/models/song.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/services/preferences_service.dart';
import 'package:this_music/shared/widgets/toaster.dart';

part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();
  MusicRepository _musicRepository = MusicRepository();

  @observable
  List<Slider> sliderData = List();

  @observable
  List<Album> lastAlbumsData = List();

  @observable
  List<Song> bestSongsData = List();

  // @observable
  // dynamic playListHomeData;

  @action
  Future init() async {
    lang = await _preferencesService.lang;
    AppLocalization.langStream.listen((value) {
      lang = value;
    });
  }

  @observable
  bool loading = false;

  @observable
  bool isFavorite = false;

  @observable
  bool autoValidate = false;

  @observable
  String lang = AppLocalization.defaultLang;

  @action
  bool isRtl() => lang == AppLocalization.ar;

  @action
  Future<List<Slider>> sliderHomePage() async {
    loading = true;
    final result = await _musicRepository.getSliderHomePage(lang);
    if (result.state == ResultStatus.FAIL) {
      Toaster.error(msg: AppLocalization.someError);
    } else {
      final data = result.data;
      sliderData = data.data as List<Slider>;
    }
    loading = false;
  }

  @action
  Future<List<Album>> lastAlbumsHomePage() async {
    loading = true;
    final result = await _musicRepository.getLastAlbumsHomePage(lang);
    if (result.state == ResultStatus.FAIL) {
      Toaster.error(msg: AppLocalization.someError);
    } else {
      final data = result.data;
      lastAlbumsData = data.data as List<Album>;
    }
    loading = false;
  }

  @action
  Future<List<Song>> bestSongsHomePage() async {
    loading = true;
    final result = await _musicRepository.getBestSongsHomePage(lang);
    if (result.state == ResultStatus.FAIL) {
      Toaster.error(msg: AppLocalization.someError);
    } else {
      final data = result.data;
      bestSongsData = data.data as List<Song>;
    }
    loading = false;
  }

  @action
  dynamic playListHomePage() async {
    loading = true;
    final result = await _musicRepository.getPlayListHomePage();
    if (result.state == ResultStatus.FAIL)
      Toaster.error(msg: AppLocalization.someError);
    else {
      final data = result.data;
      return data;
    }
    loading = false;
  }
}
