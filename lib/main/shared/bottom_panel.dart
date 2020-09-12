import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:this_music/colors.dart';

class BottomPanel extends StatefulWidget {
  @override
  _BottomPanelState createState() => _BottomPanelState();
}

class _BottomPanelState extends State<BottomPanel> {
  bool isExpanded = false;
  bool _isFav = false;
  changeIsExpandedView() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThisMusicColors.BottomPanel,
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      child: ExpansionTile(
        title: Text('song', style: TextStyle(color: ThisMusicColors.white)),
        initiallyExpanded: isExpanded,
        trailing: isExpanded
            ? Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              )
            : Icon(
                Icons.arrow_drop_up,
                color: Colors.white,
              ),
        onExpansionChanged: (_) {
          changeIsExpandedView();
        },
        children: <Widget>[
          _buildBottomPanel(),
        ],
      ),
    );
  }

  _buildBottomPanel() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 7, bottom: 5),
            child: Row(
              children: <Widget>[
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
                      setState(() {
                        _isFav = !_isFav;
                      });
                    },
                    child: _isFav
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
