import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:audio_service/audio_service.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:rxdart/rxdart.dart';
import 'package:this_music/music/player/music_player_background_task.dart';
import 'package:this_music/music/player/music_player_controller.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/animations/player_anim.dart';
import 'package:this_music/colors.dart';

class MusicPlayerPage extends StatefulWidget {
  @override
  _MusicPlayerPageState createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage>
    with TickerProviderStateMixin {
  final BehaviorSubject<double> _dragPositionSubject =
      BehaviorSubject.seeded(null);
  double _dragValue;
  Duration _remaining;

  MusicPlayerController _musicPlayerController = MusicPlayerController();
  AnimationController controllerPlayer;
  Animation<double> animationPlayer;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final _commonTween = new Tween<double>(begin: 0.0, end: 1.0);

  final _queue = <MediaItem>[
    MediaItem(
        id:
            "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
        album: "Science Friday",
        title: "A Salute To Head-Scratching Science",
        artist: "Science Friday and WNYC Studios",
        duration: Duration(milliseconds: 5739820),
        artUri:
            "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg"),
    MediaItem(
        id: "https://s3.amazonaws.com/scifri-segments/scifri201711241.mp3",
        album: "Science satrday",
        title: "From Cat Rheology To Operatic Incompetence",
        artist: "Science Friday and WNYC Studios",
        duration: Duration(milliseconds: 2856950),
        artUri:
            "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg"),
  ];

  @override
  void initState() {
    super.initState();
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
    _musicPlayerController.run(_queue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: ThisMusicColors.BottomPanel,
        body: Stack(children: [
          Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                ThisMusicColors.playerGradientLow,
                ThisMusicColors.playerGradientHigh
              ], focal: Alignment.center, focalRadius: 0.3, radius: 0.9)),
              child: SafeArea(
                  top: true,
                  bottom: true,
                  right: false,
                  left: false,
                  child: StreamBuilder<AudioState>(
                      stream: _audioStateStream,
                      builder: (context, snapshot) {
                        final audioState = snapshot.data;
                        final queue = audioState?.queue;
                        final speed = audioState?.playbackState?.speed ?? 0.0;
                        final mediaItem = audioState?.mediaItem;
                        final playbackState = audioState?.playbackState;
                        final processingState =
                            playbackState?.processingState ??
                                AudioProcessingState.none;
                        final playing = playbackState?.playing ?? false;
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              _buildAppBar(),
                              _buildPictureTitle(mediaItem),
                              SizedBox(height: 8.0),
                              _buildSeekBarIndicator(mediaItem, playbackState),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    StreamBuilder<double>(
                                        stream: _musicPlayerController
                                            .audioPlayer.speedStream,
                                        builder: (context, snapshot) =>
                                            IconButton(
                                                icon: Text(
                                                    "${snapshot.data?.toStringAsFixed(1)}x",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          ThisMusicColors.white,
                                                    )),
                                                onPressed: () {
                                                  _showSliderVolumeDialog(
                                                      context: context,
                                                      title: "Adjust speed",
                                                      currentValue: speed,
                                                      divisions: 15,
                                                      min: 0,
                                                      max: 15,
                                                      onChanged: (speed) async {
                                                        await AudioService
                                                            .setSpeed(speed);
                                                      });
                                                }))
                                  ]),
                              _buildControllerButtons(
                                  context,
                                  _musicPlayerController.audioPlayer,
                                  mediaItem,
                                  queue,
                                  processingState,
                                  playing),
                              /*TODO Visualizer*/
                            ]);
                      })))
        ]));
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
                  onPressed: () => Navigator.pop(context, true)),
              IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    size: 25.0,
                    color: ThisMusicColors.white,
                  ),
                  onPressed: () {
                    _buildShowShareFavoriteSheet();
                  })
            ]));
  }

  _buildSeekBarIndicator(MediaItem mediaItem, PlaybackState state) {
    return StreamBuilder(
        stream: Rx.combineLatest2<double, double, double>(
            _dragPositionSubject.stream,
            Stream.periodic(Duration(milliseconds: 200)),
            (dragPosition, _) => dragPosition),
        builder: (context, snapshot) {
          Duration position = state?.currentPosition ?? Duration.zero;
          Duration duration = mediaItem?.duration ?? Duration.zero;
          _remaining = duration - position;
          return Stack(
            children: [
              if (duration != null)
                Slider(
                    min: 0.0,
                    max: duration.inMilliseconds.toDouble(),
                    value: min(_dragValue ?? position.inMilliseconds.toDouble(),
                        duration.inMilliseconds.toDouble()),
                    onChanged: (position) {
                      setState(() {
                        _dragPositionSubject.add(position);
                        _dragValue = position;
                      });
                    },
                    onChangeEnd: (newPosition) {
                      setState(() {
                        AudioService.seekTo(
                            Duration(milliseconds: newPosition.round()));
                        _dragValue = null;
                        _dragPositionSubject.add(null);
                      });
                    }),
              if (duration != null)
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
        });
  }

  _buildShowShareFavoriteSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (_) => Container(
            color: ThisMusicColors.BottomPanel,
            child: Container(
                decoration: BoxDecoration(
                    color: ThisMusicColors.songItemCard,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.favorite_border,
                          color: ThisMusicColors.white),
                      title: Text(AppLocalization.favorite,
                          style: TextStyle(color: ThisMusicColors.white))),
                  GestureDetector(
                      onTap: () async {
                        Navigator.pop(context);
                        await FlutterShare.share(
                            title: 'Song name',
                            text: "Album name from This Music",
                            linkUrl:
                                'https://www.youtube.com/watch?v=1fYllJyZgdU');
                      },
                      child: ListTile(
                          leading: Icon(EvaIcons.share,
                              color: ThisMusicColors.white),
                          title: Text(AppLocalization.share,
                              style: TextStyle(color: ThisMusicColors.white))))
                ]))));
  }

  _buildPictureTitle(MediaItem mediaItem) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.25,
            padding: const EdgeInsets.all(8.0),
            child: RotatePlayer(
                animation: _commonTween.animate(controllerPlayer),
                image: mediaItem?.artUri ?? null)),
        Text(mediaItem?.title ?? "Song",
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ThisMusicColors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        Text(mediaItem?.album ?? "title",
            maxLines: 1,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300))
      ]),
    );
  }

  _buildControllerButtons(
      BuildContext context,
      AudioPlayer player,
      MediaItem mediaItem,
      List<MediaItem> queue,
      AudioProcessingState processingState,
      bool playing) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
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
                });
          }),
      StreamBuilder<SequenceState>(
          stream: player.sequenceStateStream,
          builder: (context, snapshot) => IconButton(
                icon: Icon(
                  EvaIcons.skipBack,
                  size: 30,
                  color: ThisMusicColors.white,
                ),
                onPressed: () async {
                  if (mediaItem == queue.first) {
                    return;
                  }
                  await AudioService.skipToPrevious();
                },
              )),
      StreamBuilder<ProcessingState>(
          stream: player.processingStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;

            if (processingState == AudioProcessingState.none)
              return IconButton(
                  iconSize: 50,
                  icon:
                      Icon(EvaIcons.playCircle, color: ThisMusicColors.button),
                  onPressed: () async {
                    _musicPlayerController.run(_queue);
                  });
            else
              return SizedBox(
                  child: playing
                      ? IconButton(
                          icon: Icon(EvaIcons.pauseCircle,
                              color: ThisMusicColors.button),
                          iconSize: 50,
                          onPressed: () =>
                              _musicPlayerController.audioServicePause())
                      : IconButton(
                          iconSize: 50,
                          icon: Icon(
                            EvaIcons.playCircle,
                            color: ThisMusicColors.button,
                          ),
                          onPressed: () =>
                              _musicPlayerController.audioServicePlay()));
          }),
      StreamBuilder<SequenceState>(
          stream: player.sequenceStateStream,
          builder: (context, snapshot) => IconButton(
                icon: Icon(EvaIcons.skipForward,
                    size: 30, color: ThisMusicColors.white),
                onPressed: () async {
                  if (mediaItem == queue.last) {
                    return;
                  }
                  await AudioService.skipToNext();
                },
              )),
      StreamBuilder<bool>(
          stream: player.shuffleModeEnabledStream,
          builder: (context, snapshot) {
            final shuffleModeEnabled = snapshot.data ?? false;
            return IconButton(
                icon: shuffleModeEnabled
                    ? Icon(Icons.shuffle, color: ThisMusicColors.button)
                    : Icon(Icons.shuffle, color: Colors.grey),
                onPressed: () async {
                  player.setShuffleModeEnabled(!shuffleModeEnabled);
                  shuffleModeEnabled
                      ? await AudioService.setShuffleMode(
                          AudioServiceShuffleMode.all)
                      : await AudioService.setShuffleMode(
                          AudioServiceShuffleMode.none);
                });
          })
    ]);
  }

  _showSliderVolumeDialog({
    BuildContext context,
    String title,
    double currentValue,
    int divisions,
    double min,
    double max,
    String valueSuffix = '',
    ValueChanged<double> onChanged,
  }) {
    showModal(
        configuration: FadeScaleTransitionConfiguration(
            transitionDuration: Duration(milliseconds: 400),
            reverseTransitionDuration: Duration(milliseconds: 400)),
        context: context,
        builder: (context) => AlertDialog(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            title: Text(title,
                style: TextStyle(fontFamily: "permanentmarker"),
                textAlign: TextAlign.center),
            content: Container(
                height: 100.0,
                child: Column(children: [
                  Text('${currentValue?.toStringAsFixed(1)}$valueSuffix',
                      style: TextStyle(
                          fontFamily: "permanentmarker",
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0)),
                  Slider(
                    divisions: divisions,
                    min: min,
                    max: max,
                    value: currentValue,
                    onChanged: (value) async {
                      onChanged(value);
                      setState(() {
                        currentValue = value;
                      });
                    },
                  )
                ]))));
  }
}

Stream<AudioState> get _audioStateStream {
  return Rx.combineLatest3<List<MediaItem>, MediaItem, PlaybackState,
      AudioState>(
    AudioService.queueStream,
    AudioService.currentMediaItemStream,
    AudioService.playbackStateStream,
    (queue, mediaItem, playbackState) => AudioState(
      queue,
      mediaItem,
      playbackState,
    ),
  );
}
