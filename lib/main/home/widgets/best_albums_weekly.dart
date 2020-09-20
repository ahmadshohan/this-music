import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:this_music/app_route.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/main/data/models/album.dart';
import 'package:this_music/main/home/home_page_controller.dart';
import 'package:this_music/shared/constant/social_media.dart';
import 'package:this_music/shared/localization/app_localization.dart';

class BestAlbumsWeekly extends StatefulWidget {
  @override
  _BestAlbumsWeeklyState createState() => _BestAlbumsWeeklyState();
}

class _BestAlbumsWeeklyState extends State<BestAlbumsWeekly> {
  HomePageController _controller = HomePageController();
  @override
  void initState() {
    super.initState();
    _controller.lastAlbumsHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: false,
      right: false,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(AppLocalization.bestAlbumsWeeklyMsg,
                style: TextStyle(
                    fontSize: 16.0,
                    color: ThisMusicColors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2)),
            SizedBox(height: 12),
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
                        onTap: () => Navigator.pushNamed(
                            context, AppRoute.albumSongsRoute),
                        child: Container(
                          width: 140,
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image(
                                  height: 120.0,
                                  width: 120.0,
                                  fit: BoxFit.cover,
                                  // image: AssetImage('assets/png/temp_news.png'),
                                  image: CachedNetworkImageProvider(
                                      '${SocialMedia.urlPrefix}upload/Album/1598612682.jpg'),
                                  // image: CachedNetworkImageProvider(
                                  //     '${SocialMedia.urlPrefix + _controller.lastAlbumsData[index].album.avatar}'),
                                ),
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
          ]),
    );
  }
}
