import 'package:flutter/material.dart';

class SharedClosable extends StatelessWidget {
  final Widget child;

  SharedClosable({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () => KeyBoard.close(context),
        child: child);
  }
}

class KeyBoard {
  static close(context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
