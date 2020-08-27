import 'package:flutter/material.dart';
import 'package:this_music/colors.dart';

class JOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;

  const JOutlineButton(
      {Key key, this.onPressed, this.text, this.color = ThisMusicColors.button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
        onPressed: onPressed,
        borderSide: BorderSide(color: color),
        textColor: color,
        highlightedBorderColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          style: TextStyle(fontSize: 14),
        ));
  }
}
