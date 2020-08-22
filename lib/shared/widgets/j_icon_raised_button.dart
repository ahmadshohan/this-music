import 'package:flutter/material.dart';

class JIconRaisedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final String text;
  final String icon;
  final double fontSize;

  const JIconRaisedButton(
      {Key key,
      this.onPressed,
      this.text,
      this.icon,
      this.color,
      this.textColor,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: RaisedButton.icon(
          onPressed: onPressed,
          color: color,
          textColor: textColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          label: Text(text,style: TextStyle(fontSize: fontSize)),
          icon: Image.asset(icon, width: 18)),
    );
  }
}
