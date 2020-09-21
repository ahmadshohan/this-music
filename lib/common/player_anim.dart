import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:this_music/shared/constant/social_media.dart';

class RotatePlayer extends AnimatedWidget {
  final image;
  RotatePlayer({Key key, Animation<double> animation, this.image})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return GestureDetector(
        onTap: () {},
        child: RotationTransition(
            turns: animation,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.transparent,
              backgroundImage: image != null
                  ? CachedNetworkImageProvider(
                      '${SocialMedia.urlPrefix + image}')
                  : AssetImage('assets/lang/turkey.png'),
            )));
  }
}
