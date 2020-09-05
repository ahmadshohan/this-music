import 'package:flutter/material.dart';

class UserPlayListPage extends StatefulWidget {
  @override
  _UserPlayListPageState createState() => _UserPlayListPageState();
}

class _UserPlayListPageState extends State<UserPlayListPage> {
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
