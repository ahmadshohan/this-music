import 'package:flutter/material.dart';
import 'package:this_music/colors.dart';

class JRaisedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const JRaisedButton({
    Key key,
    this.onPressed,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: ThisMusicColors.button,
        textColor: ThisMusicColors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Text(text));
  }
}
