import 'dart:ui';
import 'dart:math';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import './data/models/song.dart';
import 'package:flutter_visualizers/Visualizers/LineBarVisualizer.dart';
import 'package:flutter_visualizers/Visualizers/LineVisualizer.dart';
import 'package:flutter_visualizers/visualizer.dart';
import 'package:this_music/animations/player_anim.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/shared/widgets/loader.dart';

class MusicPlayerPage extends StatefulWidget {
  static const routerName = '/music-player/music-player-page';

  @override
  _MusicPlayerPageState createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage>
    with TickerProviderStateMixin {
  AnimationController controllerPlayer;
  Animation<double> animationPlayer;
  final _commonTween = new Tween<double>(begin: 0.0, end: 1.0);
  AudioPlayer _player;
  // ConcatenatingAudioSource _playlist = ConcatenatingAudioSource(children: [
  //   LoopingAudioSource(
  //     count: 2,
  //     child: ClippingAudioSource(
  //       start: Duration(seconds: 60),
  //       end: Duration(seconds: 65),
  //       child: AudioSource.uri(Uri.parse(
  //           "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3")),
  //       tag: Song(
  //         album: "Science Friday",
  //         title: "A Salute To Head-Scratching Science (5 seconds)",
  //         pic:
  //             "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
  //       ),
  //     ),
  //   ),
  //   AudioSource.uri(
  //     Uri.parse(
  //         "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3"),
  //     tag: Song(
  //       album: "Science Friday",
  //       title: "A Salute To Head-Scratching Science",
  //       pic:
  //           "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
  //     ),
  //   ),
  //   AudioSource.uri(
  //     Uri.parse("https://s3.amazonaws.com/scifri-segments/scifri201711241.mp3"),
  //     tag: Song(
  //       album: "Science Friday",
  //       title: "From Cat Rheology To Operatic Incompetence",
  //       pic:
  //           "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
  //     ),
  //   ),
  // ]);

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    controllerPlayer = new AnimationController(
        duration: const Duration(milliseconds: 15000), vsync: this);
    animationPlayer =
        new CurvedAnimation(parent: controllerPlayer, curve: Curves.linear);
    animationPlayer.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controllerPlayer.repeat();
      } else if (status == AnimationStatus.dismissed) {
        controllerPlayer.forward();
      }
    });
    _init();
  }

  _init() async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    try {
      await _player.setUrl(
          "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3");
    } catch (e) {
      // catch load errors: 404, invalid url ...
      print("An error occured $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
          ThisMusicColors.playerGradientLow,
          ThisMusicColors.playerGradientHigh
        ], focal: Alignment.center, focalRadius: 0.3, radius: 0.9)),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildAppBar(),
                    _buildPictureTitle(_player),
                    StreamBuilder<Duration>(
                      stream: _player.durationStream,
                      builder: (context, snapshot) {
                        final duration = snapshot.data ?? Duration.zero;
                        return StreamBuilder<Duration>(
                          stream: _player.positionStream,
                          builder: (context, snapshot) {
                            var position = snapshot.data ?? Duration.zero;
                            if (position > duration) {
                              position = duration;
                            }
                            return SeekBar(
                              duration: duration,
                              position: position,
                              onChangeEnd: (newPosition) {
                                _player.seek(newPosition);
                              },
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            EvaIcons.volumeUp,
                            color: ThisMusicColors.white,
                          ),
                          onPressed: () {
                            _showSliderDialog(
                              context: context,
                              title: "Adjust volume",
                              divisions: 10,
                              min: 0.0,
                              max: 1.0,
                              stream: _player.volumeStream,
                              onChanged: _player.setVolume,
                            );
                          },
                        ),
                        StreamBuilder<double>(
                          stream: _player.speedStream,
                          builder: (context, snapshot) => IconButton(
                            icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ThisMusicColors.white,
                                )),
                            onPressed: () {
                              _showSliderDialog(
                                context: context,
                                title: "Adjust speed",
                                divisions: 10,
                                min: 0.5,
                                max: 1.5,
                                stream: _player.speedStream,
                                onChanged: _player.setSpeed,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    _buildControllerButtons(context, _player),
                    /*TODO Visualizer*/
                    // Container(
                    //   height: MediaQuery.of(context).size.height * 0.2,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: Visualizer(
                    //     builder: (BuildContext context, List<int> wave) {
                    //       return CustomPaint(
                    //         painter: LineBarVisualizer(
                    //           waveData: wave,
                    //           height:
                    //               MediaQuery.of(context).size.height * 0.2,
                    //           width: MediaQuery.of(context).size.width,
                    //           color: Colors.red,
                    //         ),
                    //         child: Container(),
                    //       );
                    //     },
                    //     id: 3,
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 25.0,
              color: ThisMusicColors.white,
            ),
            onPressed: () async {
              if (_player.playing) {
                await _player.pause();
              }
              Navigator.pop(context, true);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.menu,
              size: 25.0,
              color: ThisMusicColors.white,
            ),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }

  _buildPictureTitle(AudioPlayer player) {
    return Expanded(
      child: StreamBuilder<SequenceState>(
        stream: player.sequenceStateStream,
        builder: (context, snapshot) {
          final state = snapshot.data;
          if (state?.sequence?.isEmpty ?? true) return SizedBox();
          final metadata = state.currentSource.tag as Song;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.4,
                padding: const EdgeInsets.all(8.0),
                child: RotatePlayer(
                    animation: _commonTween.animate(controllerPlayer)),
              ),
              // Text(
              //   metadata.album ?? '',
              //   style: TextStyle(
              //       color: ThisMusicColors.white,
              //       fontSize: 30,
              //       fontWeight: FontWeight.bold),
              // ),
              // Text(
              //   metadata.title ?? '',
              //   style:
              //       TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              // ),
            ],
          );
        },
      ),
    );
  }

  _buildControllerButtons(BuildContext context, AudioPlayer player) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        StreamBuilder<LoopMode>(
          stream: player.loopModeStream,
          builder: (context, snapshot) {
            final loopMode = snapshot.data ?? LoopMode.off;
            const icons = [
              Icon(Icons.repeat, color: Colors.grey),
              Icon(Icons.repeat, color: ThisMusicColors.button),
              Icon(Icons.repeat_one, color: ThisMusicColors.button),
            ];
            const cycleModes = [
              LoopMode.off,
              LoopMode.all,
              LoopMode.one,
            ];
            final index = cycleModes.indexOf(loopMode);
            return IconButton(
              icon: icons[index],
              onPressed: () {
                player.setLoopMode(cycleModes[
                    (cycleModes.indexOf(loopMode) + 1) % cycleModes.length]);
              },
            );
          },
        ),
        StreamBuilder<SequenceState>(
          stream: player.sequenceStateStream,
          builder: (context, snapshot) => IconButton(
            icon: Icon(
              EvaIcons.skipBack,
              size: 30,
              color: ThisMusicColors.white,
            ),
            onPressed: player.hasPrevious ? player.seekToPrevious : null,
          ),
        ),
        StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return Container(
                margin: EdgeInsets.all(8.0),
                width: 64.0,
                height: 64.0,
                child: Loader(
                  withBgOverlay: false,
                ),
              );
            } else if (playing != true) {
              return IconButton(
                icon: Icon(
                  EvaIcons.playCircle,
                  color: ThisMusicColors.button,
                ),
                iconSize: 64.0,
                onPressed: player.play,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                icon: Icon(
                  EvaIcons.pauseCircle,
                  color: ThisMusicColors.button,
                ),
                iconSize: 64.0,
                onPressed: player.pause,
              );
            } else {
              return IconButton(
                icon: Icon(
                  Icons.replay,
                  color: ThisMusicColors.white,
                ),
                iconSize: 64.0,
                onPressed: () => player.seek(Duration.zero, index: 0),
              );
            }
          },
        ),
        StreamBuilder<SequenceState>(
          stream: player.sequenceStateStream,
          builder: (context, snapshot) => IconButton(
            icon: Icon(
              EvaIcons.skipForward,
              size: 30,
              color: ThisMusicColors.white,
            ),
            onPressed: player.hasNext ? player.seekToNext : null,
          ),
        ),
        StreamBuilder<bool>(
          stream: player.shuffleModeEnabledStream,
          builder: (context, snapshot) {
            final shuffleModeEnabled = snapshot.data ?? false;
            return IconButton(
              icon: shuffleModeEnabled
                  ? Icon(Icons.shuffle, color: ThisMusicColors.button)
                  : Icon(Icons.shuffle, color: Colors.grey),
              onPressed: () {
                player.setShuffleModeEnabled(!shuffleModeEnabled);
              },
            );
          },
        ),
      ],
    );
  }
}

class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final ValueChanged<Duration> onChanged;
  final ValueChanged<Duration> onChangeEnd;

  SeekBar({
    @required this.duration,
    @required this.position,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double _dragValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Slider(
          min: 0.0,
          max: widget.duration.inMilliseconds.toDouble(),
          value: min(_dragValue ?? widget.position.inMilliseconds.toDouble(),
              widget.duration.inMilliseconds.toDouble()),
          onChanged: (value) {
            setState(() {
              _dragValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged(Duration(milliseconds: value.round()));
            }
          },
          onChangeEnd: (value) {
            if (widget.onChangeEnd != null) {
              widget.onChangeEnd(Duration(milliseconds: value.round()));
            }
            _dragValue = null;
          },
        ),
        Positioned(
          top: 29,
          right: 16.0,
          bottom: 0.0,
          child: Text(
              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                      .firstMatch("$_remaining")
                      ?.group(1) ??
                  '$_remaining',
              style: TextStyle(color: ThisMusicColors.button)),
        ),
      ],
    );
  }

  Duration get _remaining => widget.duration - widget.position;
}

_showSliderDialog({
  BuildContext context,
  String title,
  int divisions,
  double min,
  double max,
  String valueSuffix = '',
  Stream<double> stream,
  ValueChanged<double> onChanged,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title,
          style: TextStyle(fontFamily: "permanentmarker"),
          textAlign: TextAlign.center),
      content: StreamBuilder<double>(
        stream: stream,
        builder: (context, snapshot) => Container(
          height: 100.0,
          child: Column(
            children: [
              Text('${snapshot.data?.toStringAsFixed(1)}$valueSuffix',
                  style: TextStyle(
                      fontFamily: "permanentmarker",
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0)),
              Slider(
                divisions: divisions,
                min: min,
                max: max,
                value: snapshot.data ?? 1.0,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
