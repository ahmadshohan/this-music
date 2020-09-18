import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:this_music/app_route.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/main/data/models/album.dart';
import 'package:this_music/main/home/home_page_controller.dart';
import 'package:this_music/shared/localization/app_localization.dart';

class BestAlbumsWeekly extends StatefulWidget {
  @override
  _BestAlbumsWeeklyState createState() => _BestAlbumsWeeklyState();
}

class _BestAlbumsWeeklyState extends State<BestAlbumsWeekly> {
  HomePageController _controller = HomePageController();
  AlbumsResult lastAlbumData;
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () async {
      lastAlbumData = await _controller.lastAlbumsHomePage();
    });
  }

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
                  itemCount: lastAlbumData.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, AppRoute.albumSongsRoute),
                      child: Container(
                        width: 140,
                        child: Column(
                          children: <Widget>[
                            Image(
                              height: 120.0,
                              width: 120.0,
                              // image: AssetImage('assets/png/temp_news.png'),
                              image: CachedNetworkImageProvider(
                                  'http://api-ahmat.thismusic.com.tr/public/${lastAlbumData.data[index].album.avatar}'),
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
