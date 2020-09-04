import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:this_music/colors.dart';
import '../tab/home/bottom_panel.dart';
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            BottomPanel(),
            Divider(height: 1),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: ThisMusicColors.BottomNavigationBar,
              ),
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                backgroundColor: ThisMusicColors.BottomNavigationBar,
                selectedIconTheme:
                    IconThemeData(color: ThisMusicColors.button, size: 25),
                unselectedIconTheme:
                    IconThemeData(color: Colors.grey, size: 16),
                selectedLabelStyle:
                    TextStyle(color: ThisMusicColors.button, fontSize: 15),
                unselectedLabelStyle:
                    TextStyle(color: Colors.grey, fontSize: 13),
                showSelectedLabels: true,
                showUnselectedLabels: true,
                onTap: (int index) {
                  _pageController.jumpToPage(index);
                },
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    backgroundColor: ThisMusicColors.BottomNavigationBar,
                    activeIcon: Icon(
                      Icons.home,
                    ),
                    icon: Icon(
                      Icons.home,
                    ),
                    title: Text(
                      AppLocalization.menu,
                    ),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: ThisMusicColors.BottomNavigationBar,
                    icon: Icon(
                      Icons.search,
                    ),
                    activeIcon: Icon(
                      Icons.search,
                    ),
                    title: Text(
                      AppLocalization.search,
                    ),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: ThisMusicColors.BottomNavigationBar,
                    icon: Icon(Icons.settings_voice),
                    activeIcon: Icon(Icons.settings_voice),
                    title: Text(
                      AppLocalization.radio,
                    ),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: ThisMusicColors.BottomNavigationBar,
                    icon: Icon(
                      Icons.library_music,
                    ),
                    activeIcon: Icon(
                      Icons.library_music,
                    ),
                    title: Text(
                      "Kitaplik",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
