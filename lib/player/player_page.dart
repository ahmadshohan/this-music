import 'dart:ui';
import 'package:flutter/material.dart';
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
      backgroundColor: ThisMusicColors.black,
      body: SafeArea(
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
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.list,
                                size: 25.0,
                                color: Colors.grey,
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.repeat,
                                  size: 25.0,
                                  color: Colors.grey,
                                )
                                // : Icon(
                                //     Icons.shuffle,
                                //     size: 25.0,
                                // //     color: Colors.grey,
                                //   ),
                                ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  size: 25.0,
                                  color: Theme.of(context).accentColor,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.cloud_done,
                                  size: 25.0,
                                  color: Theme.of(context).accentColor,
                                )),
                          ]),
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
                        style: TextStyle(fontSize: 20.0),
                      ),
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
