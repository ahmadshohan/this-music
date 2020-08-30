import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RotatePlayer extends AnimatedWidget {
  RotatePlayer({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    // SongModel songModel = Provider.of(context);
    return GestureDetector(
      onTap: () {},
      child: RotationTransition(
        turns: animation,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage('assets/lang/turkey.png')
                // CachedNetworkImageProvider(songModel.currentSong.pic),
                ),
          ),
        ),
      ),
    );
  }
}
