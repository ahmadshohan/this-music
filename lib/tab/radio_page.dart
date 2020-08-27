import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        padding: EdgeInsets.all(10),
        child: SafeArea(
          top: true,
          bottom: true,
          left: false,
          right: false,
          child: Column(
            children: <Widget>[],
          ),
        ));
  }
}
