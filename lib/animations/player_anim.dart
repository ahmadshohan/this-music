import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
            child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: image != null
                            ? CachedNetworkImageProvider(image)
                            : AssetImage('assets/lang/turkey.png'))))));
  }
}
