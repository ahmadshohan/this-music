import 'package:flutter/material.dart';
import 'package:this_music/app_route.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/shared/localization/app_localization.dart';

class PlayListPage extends StatefulWidget {
  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          color: ThisMusicColors.flexibleBarGradientHigh,
          child: SafeArea(
            top: true,
            bottom: true,
            left: false,
            right: false,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  snap: true,
                  pinned: true,
                  floating: true,
                  title: Center(
                    child: Text('Album Name',
                        style: TextStyle(
                            color: ThisMusicColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                  ),
                  expandedHeight: MediaQuery.of(context).size.height * 0.35,
                  flexibleSpace: _flexibleSpaceBar(),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (ctx, index) => GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, AppRoute.musicPlayerRoute),
                              child: _buildSongItem(),
                            ),
                        childCount: 50)),
              ],
            ),
          )),
    );
  }

  _flexibleSpaceBar() {
    return FlexibleSpaceBar(
      background: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            ThisMusicColors.flexibleBarGradientLow,
            ThisMusicColors.flexibleBarGradientHigh
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Album Name',
                style: TextStyle(
                    color: ThisMusicColors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            Text(AppLocalization.exclusiveSongsMsg,
                style: TextStyle(color: Colors.grey, fontSize: 16))
          ],
        ),
      ),
    );
  }

  _buildSongItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
      child: Card(
        color: ThisMusicColors.songItemCard,
        elevation: 13,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 5, top: 8, bottom: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                    width: 60,
                    height: 60,
                    child: Image.asset('assets/lang/turkey.png')),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Song name",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: ThisMusicColors.white,
                          fontWeight: FontWeight.w900),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'singer name',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: Color(0xFFE0E0E0),
                  size: 23.0,
                )),
          ],
        ),
      ),
    );
  }
}
