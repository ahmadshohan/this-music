import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:this_music/app_route.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/widgets/closable.dart';

class SearchPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SearchPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        child: SafeArea(
            top: true,
            bottom: true,
            left: false,
            right: false,
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  _buildSearchBar(),
                  _buildCategoryTypesAndMoodActivity()
                ]))));
  }

  _buildSearchBar() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
        child: Row(children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    controller: _searchController,
                    onChanged: (value) {},
                    onSubmitted: (value) {
                      KeyBoard.close(context);
                      /*todo handle search*/
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(
                          EvaIcons.search,
                          color: Colors.black,
                        ),
                        hintText: AppLocalization.searchSuggest,
                        hintStyle: TextStyle(color: Colors.blueGrey))),
              ))
        ]));
  }

  _buildCategoryTypesAndMoodActivity() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(AppLocalization.types,
                  style: TextStyle(
                      color: ThisMusicColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildCategoryType(),
              Divider(color: Colors.white60),
              Text(AppLocalization.moodActivities,
                  style: TextStyle(
                      color: ThisMusicColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildMoodActivity(),
              Divider(color: Colors.white60),
            ]));
  }

  _buildCategoryType() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(children: <Widget>[
          Expanded(flex: 1, child: _buildListCategoryType()),
          Expanded(flex: 1, child: _buildListCategoryType())
        ]));
  }

  _buildListCategoryType() {
    return Container(
      width: double.infinity,
      child: ListView.builder(
        reverse: true,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) => _buildSingleCategoryItem(),
      ),
    );
  }

  _buildSingleCategoryItem() {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).pushNamed(AppRoute.categoryAlbumsRoute),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(
              "assets/lang/turkey.png",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'category',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  _buildMoodActivity() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(children: <Widget>[
            _buildMoodActivityType(),
            SizedBox(width: 10),
            _buildMoodActivityType(),
            SizedBox(width: 10),
            _buildMoodActivityType(),
          ]),
        ),
        SizedBox(height: 10),
        Expanded(
          flex: 1,
          child: Row(children: <Widget>[
            _buildMoodActivityType(),
            SizedBox(width: 10),
            _buildMoodActivityType(),
            SizedBox(width: 10),
            _buildMoodActivityType(),
          ]),
        )
      ]),
    );
  }

  _buildMoodActivityType() {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, AppRoute.categoryAlbumsRoute),
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
                    Text('Mood Name',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                        width: 30,
                        child: Divider(thickness: 2, color: Colors.white))
                  ]),
            )
          ]),
        ));
  }
}
