import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/tab/play_List_page.dart';
import 'package:this_music/tab/radio_page.dart';
import 'package:this_music/tab/search_page.dart';

import 'home/home_page.dart';

class TabNavigator extends StatefulWidget {
  static const routerName = '/tab-page';
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  var _pageController = PageController();
  int _selectedIndex = 0;

  List<Widget> pages = <Widget>[
    HomePage(),
    SearchPage(),
    RadioPage(),
    PlayListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Theme.of(context).brightness == Brightness.dark
            ? Brightness.dark
            : Brightness.light));
    return Scaffold(
      backgroundColor: ThisMusicColors.tabBackGround,
      body: PageView.builder(
        itemBuilder: (ctx, index) => pages[index],
        itemCount: pages.length,
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: ThisMusicColors.BottomNavigationBar,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          backgroundColor: ThisMusicColors.BottomNavigationBar,
          showUnselectedLabels: true,
          onTap: (int index) {
            _pageController.jumpToPage(index);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: ThisMusicColors.BottomNavigationBar,
              activeIcon: Icon(
                Icons.home,
                size: 20.0,
              ),
              icon: Icon(
                Icons.home,
                size: 20.0,
              ),
              title: Text(
                AppLocalization.menu,
                style: TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: ThisMusicColors.BottomNavigationBar,
              icon: Icon(
                Icons.search,
                size: 20.0,
              ),
              activeIcon: Icon(
                Icons.search,
                size: 20.0,
                color: Colors.white,
              ),
              title: Text(
                AppLocalization.search,
                style: TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: ThisMusicColors.BottomNavigationBar,
              icon: Icon(Icons.settings_voice),
              activeIcon: Icon(Icons.settings_voice),
              title: Text(
                AppLocalization.radio,
                style: TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: ThisMusicColors.BottomNavigationBar,
              icon: Icon(
                Icons.library_music,
                size: 20.0,
              ),
              activeIcon: Icon(
                Icons.library_music,
                size: 20.0,
                color: Colors.white,
              ),
              title: Text(
                "Kitaplik",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
