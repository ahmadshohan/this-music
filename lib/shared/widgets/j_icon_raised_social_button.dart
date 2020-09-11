import 'package:flutter/material.dart';

class JIconRaisedSocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final Color iconColor;
  final Color textColor;
  final String text;
  final String icon;
  final double fontSize;

  const JIconRaisedSocialButton(
      {Key key,
      this.onPressed,
      this.text,
      this.icon,
      this.iconColor,
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            label: Text(text,
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
            icon: Image.asset(icon, width: 18, color: iconColor)));
  }
}
