import 'package:flutter/material.dart';

class ThisMusicLogo extends StatelessWidget {
  final double height;

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  ThisMusicLogo({this.height, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    Widget image;
    if (height == null)
      image = Image.asset('assets/png/splash_logo.png');
    else
      image = Image.asset('assets/png/splash_logo.png', height: height);

    return Container(
      margin: margin ?? const EdgeInsets.all(0),
      padding: padding ?? const EdgeInsets.all(0),
      child: image,
    );
  }
}
