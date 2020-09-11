import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mobx/mobx.dart';
import 'package:this_music/main.dart';
import 'package:this_music/music/data/models/song.dart';

part 'music_player_controller.g.dart';

class MusicPlayerController = _MusicPlayerControllerBase
    with _$MusicPlayerController;

abstract class _MusicPlayerControllerBase with Store {
  @observable
  bool loading = false;

  AudioPlayer _audioPlayer = AudioPlayer();
  AudioPlayer get audioPlayer => _audioPlayer;

  String _url =
      "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3";
  get url => _url;
  putUrl(String url) => _url = url;

  int get playerSessionId => _audioPlayer.androidAudioSessionId;

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  setPlaying(bool isPlaying) {
    _isPlaying = isPlaying;
  }

  bool _isRepeat = true;
  bool get isRepeat => _isRepeat;
  changeRepeat() {
    _isRepeat = !_isRepeat;
  }

  bool _showList = false;
  bool get showList => _showList;
  setShowList(bool showList) {
    _showList = showList;
  }

  List<Song> _songs;
  List<Song> get songs => _songs;
  setSongs(List<Song> songs) {
    _songs = songs;
  }

  addSongs(List<Song> songs) {
    _songs.addAll(songs);
  }

  int _currentSongIndex = 0;
  int get length => _songs.length;
  int get songNumber => _currentSongIndex + 1;

  setCurrentIndex(int index) {
    _currentSongIndex = index;
  }

  bool _playNow = false;
  bool get playNow => _playNow;
  setPlayNow(bool playNow) {
    _playNow = playNow;
  }

  Song get currentSong => _songs[_currentSongIndex];

  Song get nextSong {
    if (isRepeat) {
      if (_currentSongIndex < length) {
        _currentSongIndex++;
      }
      if (_currentSongIndex == length) {
        _currentSongIndex = 0;
      }
    } else {
      Random r = new Random();
      _currentSongIndex = r.nextInt(_songs.length);
    }
    return _songs[_currentSongIndex];
  }

  Song get prevSong {
    if (isRepeat) {
      if (_currentSongIndex > 0) {
        _currentSongIndex--;
      }
      if (_currentSongIndex == 0) {
        _currentSongIndex = length - 1;
      }
    } else {
      Random r = new Random();
      _currentSongIndex = r.nextInt(_songs.length);
    }

    return _songs[_currentSongIndex];
  }

  Duration _position;
  Duration get position => _position;
  void setPosition(Duration position) {
    _position = position;
  }

  Duration _duration;
  Duration get duration => _duration;
  void setDuration(Duration duration) {
    _duration = duration;
  }

  startAudioServiceWithData({dynamic data}) async {
    await AudioService.start(
        backgroundTaskEntrypoint: audioPlayerTaskEntryPoint,
        androidNotificationChannelName: 'This Music',
        androidNotificationColor: 0xFF083838,
        androidNotificationIcon: 'mipmap/launcher_icon',
        androidNotificationClickStartsActivity: true,
        androidStopForegroundOnPause: true,
        androidEnableQueue: true,
        params: data);
  }

}
