import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_visualizers/Visualizers/LineBarVisualizer.dart';
import 'package:flutter_visualizers/Visualizers/LineVisualizer.dart';
import 'package:flutter_visualizers/visualizer.dart';
import 'package:this_music/animations/player_anim.dart';
import 'package:this_music/colors.dart';

class PlayerPage extends StatefulWidget {
  static const routerName = '/player/player-page';
  final bool nowPlay;

  PlayerPage({this.nowPlay});

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> with TickerProviderStateMixin {
  AnimationController controllerPlayer;
  Animation<double> animationPlayer;
  final _commonTween = new Tween<double>(begin: 0.0, end: 1.0);

  @override
  initState() {
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
  }

  @override
  void dispose() {
    controllerPlayer.dispose();
    super.dispose();
  }

  String getSongUrl() {
    return 'https://www.esm3.com/song-288273.html';
  }

  @override
  Widget build(BuildContext context) {
    // if (songModel.isPlaying) {
    //   controllerPlayer.forward();
    // } else {
    //   controllerPlayer.stop(canceled: false);
    // }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
          ThisMusicColors.playerGradientLow,
          ThisMusicColors.playerGradientHigh
        ], focal: Alignment.center, focalRadius: 0.2, radius: 0.9)),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    // !songModel.showList
                    //     ?
                    Column(
                      children: <Widget>[
                        _BuildAppBar(),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        RotatePlayer(
                            animation: _commonTween.animate(controllerPlayer)),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Text(
                          " currentSong.author",
                          style: TextStyle(color: Colors.grey, fontSize: 15.0),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Text(
                          "currentSong.title",
                          style: TextStyle(color: Colors.grey, fontSize: 20.0),
                        ),
                        /*TODO Visualizer*/
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width,
                          child: Visualizer(
                            builder: (BuildContext context, List<int> wave) {
                              return CustomPaint(
                                painter: LineBarVisualizer(
                                  waveData: wave,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.red,
                                ),
                                child: Container(),
                              );
                            },
                            id: 3,
                          ),
                        )
                      ],
                    )
                    // : SongListCarousel(),
                  ],
                ),
              ),
              // Player(
              //   songData: songModel,
              //   downloadData: downloadModel,
              //   nowPlay: widget.nowPlay,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  _BuildAppBar() {
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
            onPressed: () => {
              Navigator.pop(context),
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
}
