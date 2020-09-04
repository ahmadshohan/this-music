import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
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
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    AppLocalization.types,
                    style: TextStyle(
                        color: ThisMusicColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                _buildAlbumTypes(),
                _buildAlbumTypes(),
                Divider(color: Colors.white60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    AppLocalization.moodActivities,
                    style: TextStyle(
                        color: ThisMusicColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                _buildAlbumTypes(),
                Divider(color: Colors.white60),
                _buildColumn(),
              ],
            ),
          ),
        ));
  }

  _buildListTile(String title, IconData icon, Function onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListTile(
          leading: Icon(
            icon,
            color: Color(0xFF39F1E2),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: ThisMusicColors.white,
            ),
          ),
        ),
      ),
    );
  }

  _buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buildListTile('yani', Icons.new_releases, () {}),
        _buildListTile('En iyiler', Icons.accessibility_new, () {}),
        _buildListTile('Personelin Sectikleri', Icons.star_border, () {}),
        _buildListTile('Sovler &Prodcast', Icons.watch_later, () {}),
      ],
    );
  }

  _buildAlbumTypes() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      width: double.infinity,
      child: ListView.builder(
        reverse: true,
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) => Expanded(
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
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
