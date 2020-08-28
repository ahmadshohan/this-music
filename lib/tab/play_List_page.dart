import 'package:flutter/material.dart';

class PlayListPage extends StatefulWidget {
  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[],
            ),
          ),
        ));
  }
}
