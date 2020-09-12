import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:this_music/music/player/music_player_controller.dart';

MediaControl playControl = MediaControl(
  androidIcon: 'drawable/ic_action_play_arrow',
  label: 'Play',
  action: MediaAction.play,
);
MediaControl pauseControl = MediaControl(
  androidIcon: 'drawable/ic_action_pause',
  label: 'Pause',
  action: MediaAction.pause,
);
MediaControl skipToNextControl = MediaControl(
  androidIcon: 'drawable/ic_action_skip_next',
  label: 'Next',
  action: MediaAction.skipToNext,
);
MediaControl skipToPreviousControl = MediaControl(
  androidIcon: 'drawable/ic_action_skip_previous',
  label: 'Previous',
  action: MediaAction.skipToPrevious,
);
MediaControl stopControl = MediaControl(
  androidIcon: 'drawable/ic_action_stop',
  label: 'Stop',
  action: MediaAction.stop,
);

class AudioPlayerTask extends BackgroundAudioTask {
  MusicPlayerController _musicPlayerController = MusicPlayerController();
  var _queue = <MediaItem>[];

  int _queueIndex = -1;

  AudioProcessingState _skipState;
  bool _playing;
  bool get hasNext => _queueIndex + 1 < _queue.length;
  int get index => _musicPlayerController.audioPlayer.currentIndex;
  bool get hasPrevious => _queueIndex > 0;

  MediaItem get mediaItem => _queueIndex == null ? null : _queue[_queueIndex];

  var _playerStateSubscription;
  var _eventSubscription;

  @override
  Future<void> onStart(Map<String, dynamic> params) async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.music());
    _queue.clear();
    List mediaItems = params['data'];
    for (int i = 0; i < mediaItems.length; i++) {
      MediaItem mediaItem = MediaItem.fromJson(mediaItems[i]);
      _queue.add(mediaItem);
    }
    try {
      await _musicPlayerController.audioPlayer.load(ConcatenatingAudioSource(
        children:
            _queue.map((item) => AudioSource.uri(Uri.parse(item.id))).toList(),
      ));
    } catch (e) {
      print("Error: $e");
      onStop();
    }

    _playerStateSubscription = _musicPlayerController
        .audioPlayer.processingStateStream
        .where((state) => state == ProcessingState.completed)
        .listen((event) {
      _handlePlaybackCompleted();
    });
    _eventSubscription =
        _musicPlayerController.audioPlayer.playbackEventStream.listen((event) {
      final bufferingState =
          event.bufferedPosition ?? AudioProcessingState.buffering ?? null;
      switch (event.processingState) {
        case ProcessingState.none:
          _broadcastState(
              processingState: bufferingState ?? AudioProcessingState.none,
              position: event.updatePosition);
          break;
        case ProcessingState.loading:
          _broadcastState(
              processingState: _skipState ?? AudioProcessingState.connecting,
              position: event.updatePosition);
          break;
        case ProcessingState.buffering:
          _broadcastState(
              processingState: _skipState ?? AudioProcessingState.buffering,
              position: event.updatePosition);
          break;
        case ProcessingState.ready:
          _broadcastState(
              processingState: _skipState ?? AudioProcessingState.ready,
              position: event.updatePosition);
          break;
        case ProcessingState.completed:
          _broadcastState(
              processingState: _skipState ?? AudioProcessingState.completed,
              position: event.updatePosition);
          break;
        default:
      }
    });
    AudioServiceBackground.setQueue(_queue);
    onSkipToNext();
  }

  @override
  Future<void> onPlay() async {
    if (_skipState == null) {
      _playing = true;
      _musicPlayerController.audioPlayer.play();
      AudioServiceBackground.sendCustomEvent('just played');
    }
  }

  @override
  Future<void> onPause() async {
    if (_skipState == null) {
      _playing = false;
      _musicPlayerController.audioPlayer.pause();
      AudioServiceBackground.sendCustomEvent('just paused');
    }
  }

  @override
  Future<void> onSkipToNext() async => skip(1);

  @override
  Future<void> onSkipToPrevious() async {
    skip(-1);
  }

  void skip(int offset) async {
    int newPos = _queueIndex + offset;
    if (!(newPos >= 0 && newPos < _queue.length)) {
      return;
    }
    if (_playing == null) {
      _playing = true;
    } else if (_playing) {
      await _musicPlayerController.audioPlayer.stop();
    }
    _queueIndex = newPos;
    _skipState = offset > 0
        ? AudioProcessingState.skippingToNext
        : AudioProcessingState.skippingToPrevious;
    AudioServiceBackground.setMediaItem(mediaItem);
    await _musicPlayerController.audioPlayer.setUrl(mediaItem.id);
    print(mediaItem.id);
    _skipState = null;
    if (_playing) {
      onPlay();
    } else {
      _broadcastState(processingState: AudioProcessingState.ready);
    }
  }

  @override
  Future<void> onStop() async {
    _playing = false;
    await _musicPlayerController.audioPlayer.pause();
    await _musicPlayerController.audioPlayer.dispose();
    _playerStateSubscription.cancel();
    _eventSubscription.cancel();
    await _broadcastState();
    await super.onStop();
  }

  @override
  Future<void> onSeekTo(Duration position) async {
    _musicPlayerController.audioPlayer.seek(position);
  }

  @override
  Future<void> onClick(MediaButton button) async {
    playPause();
  }

  @override
  Future<void> onFastForward() async {
    await _seekRelative(fastForwardInterval);
  }

  @override
  Future<void> onRewind() async {
    await _seekRelative(rewindInterval);
  }

  @override
  void onAudioBecomingNoisy() {
    playPause();
  }

  @override
  void onAudioFocusGained() {
    playPause();
  }

  @override
  void onAudioFocusLost() {
    playPause();
  }

  @override
  void onAudioFocusLostTransient() {
    playPause();
  }

  @override
  void onAudioFocusLostTransientCanDuck() {
    playPause();
  }

  Future<void> _seekRelative(Duration offset) async {
    var newPosition = _musicPlayerController.audioPlayer.position + offset;
    if (newPosition < Duration.zero) {
      newPosition = Duration.zero;
    }
    if (newPosition > mediaItem.duration) {
      newPosition = mediaItem.duration;
    }
    await _musicPlayerController.audioPlayer.seek(newPosition);
  }

  _handlePlaybackCompleted() {
    if (hasNext) {
      onSkipToNext();
    } else {
      onStop();
    }
  }

  void playPause() {
    if (AudioServiceBackground.state.playing)
      onPause();
    else
      onPlay();
  }

  Future<void> onTaskRemoved() async {
    if (!AudioServiceBackground.state.playing) {
      onStop();
    }
  }

  AudioProcessingState _getProcessingState() {
    if (_skipState != null) return _skipState;
    switch (_musicPlayerController.audioPlayer.processingState) {
      case ProcessingState.none:
        return AudioProcessingState.stopped;
      case ProcessingState.loading:
        return AudioProcessingState.connecting;
      case ProcessingState.buffering:
        return AudioProcessingState.buffering;
      case ProcessingState.ready:
        return AudioProcessingState.ready;
      case ProcessingState.completed:
        return AudioProcessingState.completed;
      default:
        throw Exception(
            "Invalid state: ${_musicPlayerController.audioPlayer.processingState}");
    }
  }

  Future<void> _broadcastState({
    AudioProcessingState processingState,
    Duration position,
    Duration bufferedPosition,
  }) async {
    if (position == null) {
      position =
          _musicPlayerController.audioPlayer.playbackEvent.bufferedPosition;
    }
    await AudioServiceBackground.setState(
      controls: [
        skipToPreviousControl,
        if (_musicPlayerController.audioPlayer.playing)
          pauseControl
        else
          playControl,
        // stopControl,
        skipToNextControl,
      ],
      systemActions: [
        MediaAction.seekTo,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      ],
      processingState: _getProcessingState(),
      playing: _playing ?? _musicPlayerController.audioPlayer.playing,
      position: position ?? _musicPlayerController.audioPlayer.position,
      bufferedPosition: bufferedPosition ??
          _musicPlayerController.audioPlayer.bufferedPosition,
      speed: _musicPlayerController.audioPlayer.speed,
    );
  }

  @override
  Future<Function> onSetSpeed(double speed) async {
    return _musicPlayerController.audioPlayer.setSpeed;
  }

  @override
  Future<Function> onSetShuffleMode(AudioServiceShuffleMode shuffleMode) {
    if (shuffleMode == AudioServiceShuffleMode.none) {
      return _musicPlayerController.audioPlayer.setShuffleModeEnabled(false);
    } else {
      return _musicPlayerController.audioPlayer.setShuffleModeEnabled(true);
    }
  }
}

class AudioState {
  final List<MediaItem> queue;
  final MediaItem mediaItem;
  final PlaybackState playbackState;

  AudioState(this.queue, this.mediaItem, this.playbackState);
}
