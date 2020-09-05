import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:this_music/app_route.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/music_player/music_player_page.dart';
import 'package:this_music/settings/settings_page.dart';
import 'file:///C:/Users/ASUS/Desktop/this_music/this_music/lib/tab/home/widgets/special_albums_for_user.dart';
import 'file:///C:/Users/ASUS/Desktop/this_music/this_music/lib/tab/home/widgets/special_user_playlist.dart';

import 'widgets/best_albums_weekly.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController controllerRecord;
  Animation<double> animationRecord;
  final _inputController = TextEditingController();
  final _commonTween = new Tween<double>(begin: 0.0, end: 1.0);

  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    controllerRecord = new AnimationController(
        duration: const Duration(milliseconds: 15000), vsync: this);
    animationRecord =
        new CurvedAnimation(parent: controllerRecord, curve: Curves.linear);
    animationRecord.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controllerRecord.repeat();
      } else if (status == AnimationStatus.dismissed) {
        controllerRecord.forward();
      }
    });
  }

  @override
  void dispose() {
    _inputController.dispose();
    controllerRecord.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSettingsIconButton(),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildStoryCarousel(),
                      SizedBox(height: 12),
                      BestAlbumsWeekly(),
                      SizedBox(
                        height: 12,
                      ),
                      SpecialAlbumsForUser(),
                      SizedBox(
                        height: 12,
                      ),
                      SpecialUserPlayLists(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  _buildStoryCarousel() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoute.musicPlayerRoute),
      child: SizedBox(
          height: 180.0,
          width: double.infinity - 15,
          child: Carousel(
            images: [
              CachedNetworkImage(
                  imageUrl:
                      'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
              CachedNetworkImage(
                  imageUrl:
                      'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
              ExactAssetImage("assets/page_design/home_page.jpeg"),
              ExactAssetImage("assets/png//temp_news.png")
            ],
            dotSize: 4.0,
            dotSpacing: 15.0,
            dotColor: Colors.lightGreenAccent,
            dotPosition: DotPosition.bottomLeft,
            indicatorBgPadding: 5.0,
            borderRadius: true,
            moveIndicatorFromBottom: 180.0,
            noRadiusForIndicator: true,
          )),
    );
  }

  _buildSettingsIconButton() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: Icon(
          Icons.settings,
          color: ThisMusicColors.white,
        ),
        onPressed: () => Navigator.pushNamed(context, AppRoute.settingsRoute),
      ),
    );
  }
}
