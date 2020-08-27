import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SearchPage> {
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
