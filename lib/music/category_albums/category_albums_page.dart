import 'package:flutter/material.dart';
import 'package:this_music/app_route.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/shared/localization/app_localization.dart';

class CategoryAlbumsPage extends StatefulWidget {
  @override
  _CategoryAlbumsPageState createState() => _CategoryAlbumsPageState();
}

class _CategoryAlbumsPageState extends State<CategoryAlbumsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          color: ThisMusicColors.flexibleBarCategoryAlbumsGradientHigh,
          child: SafeArea(
              top: true,
              bottom: true,
              left: false,
              right: false,
              child: CustomScrollView(slivers: <Widget>[
                SliverAppBar(
                    snap: true,
                    pinned: true,
                    floating: true,
                    title: Center(
                      child: Text('Category Name',
                          style: TextStyle(
                              color: ThisMusicColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                    ),
                    expandedHeight: MediaQuery.of(context).size.height * 0.35,
                    flexibleSpace: _flexibleSpaceBar()),
                SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 1.8,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 10),
                    delegate: SliverChildBuilderDelegate(
                      (ctx, index) => GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, AppRoute.albumSongsRoute),
                        child: _buildCategoryItem(),
                      ),
                      childCount: 50,
                    )),
              ]))),
    );
  }

  _flexibleSpaceBar() {
    return FlexibleSpaceBar(
        background: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                ThisMusicColors.flexibleBarCategoryAlbumsGradientLow,
                ThisMusicColors.flexibleBarCategoryAlbumsGradientHigh
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
            )),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Category Name',
                      style: TextStyle(
                          color: ThisMusicColors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  Text(AppLocalization.exclusiveAlbumsMsg,
                      style: TextStyle(color: Colors.grey, fontSize: 16))
                ])));
  }

  _buildCategoryItem() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset('assets/png/temp_news.png',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover),
          ),
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Album Name',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                      width: 30,
                      child: Divider(thickness: 2, color: Colors.white))
                ]),
          )
        ]));
  }
}
