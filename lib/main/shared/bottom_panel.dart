import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/music/player/music_player_controller.dart';

class BottomPanel extends StatefulWidget {
  @override
  _BottomPanelState createState() => _BottomPanelState();
}

class _BottomPanelState extends State<BottomPanel> {
  MusicPlayerController _controller = MusicPlayerController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        color: ThisMusicColors.BottomPanel,
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        child: ExpansionTile(
          title: Text('song', style: TextStyle(color: ThisMusicColors.white)),
          initiallyExpanded: _controller.isExpanded,
          trailing: _controller.isExpanded
              ? Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                )
              : Icon(
                  Icons.arrow_drop_up,
                  color: Colors.white,
                ),
          onExpansionChanged: (_) {
            _controller.changeIsExpandedView();
          },
          children: <Widget>[
            _buildBottomPanel(),
          ],
        ),
      ),
    );
  }

  _buildBottomPanel() {
    return Row(children: <Widget>[
      Expanded(
          child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 7, bottom: 5),
              child: Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20, left: 5, bottom: 5),
                  child: Image.asset("assets/lang/turkey.png", height: 60),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'song',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        color: ThisMusicColors.white,
                      ),
                    ),
                    Text(
                      'artists',
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 11, color: ThisMusicColors.white),
                    ),
                  ],
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      _controller.changeViewIsFavourite();
                    },
                    child: _controller.isFavorite
                        ? Icon(Icons.favorite, color: ThisMusicColors.white)
                        : Icon(Icons.favorite_border,
                            color: ThisMusicColors.white)),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.play_arrow,
                      color: ThisMusicColors.white,
                    ))
              ])))
    ]);
  }
}
