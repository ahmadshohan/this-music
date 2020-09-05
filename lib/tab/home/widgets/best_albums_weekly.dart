import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:this_music/app_route.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/music_player/play_list/play_List_page.dart';
import 'package:this_music/shared/localization/app_localization.dart';

class BestAlbumsWeekly extends StatefulWidget {
  // final List<Song> alubums;

  // BestAlbumsWeekly(this.alubums);
  @override
  _BestAlbumsWeeklyState createState() => _BestAlbumsWeeklyState();
}

class _BestAlbumsWeeklyState extends State<BestAlbumsWeekly> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(AppLocalization.bestAlbumsWeeklyMsg,
              style: TextStyle(
                  fontSize: 16.0,
                  color: ThisMusicColors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2)),
          SizedBox(
            height: 12,
          ),
          Column(
            children: <Widget>[
              Container(
                height: 150,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoute.playListRoute),
                      child: Container(
                        width: 140,
                        // margin: index == widget.alubums.length - 1
                        //     ? EdgeInsets.only(right: 20.0)
                        //     : EdgeInsets.only(right: 0.0),
                        child: Column(
                          children: <Widget>[
                            Image(
                              height: 120.0,
                              width: 120.0,
                              image: AssetImage('assets/png/temp_news.png'),
                              // image: CachedNetworkImageProvider(
                              //     'assets/lang/turkey.png'),
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ]);
  }
}
