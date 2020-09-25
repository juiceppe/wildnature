import 'package:wildnature/faunaInfo.dart';
import 'package:wildnature/hikePaths.dart';
import 'package:wildnature/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:wildnature/profilePage.dart';
import 'settingsPage.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectePage = 0;
  final _pageIndex = [
    HikePage(),
    FaunaInfoPage(),
    MainPage(),
    ProfilePage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ConvexAppBar(
          height: 40,
          curveSize: 70,
          backgroundColor: Colors.teal[500],
          style: TabStyle.textIn,
          items: [
            TabItem(icon: Icons.map, title: 'Hike Paths'),
            TabItem(icon: Icons.info, title: 'Fauna Info'),
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.person, title: 'Profile'),
            TabItem(icon: Icons.settings, title: 'Settings'),
          ],
          initialActiveIndex: 2,
          onTap: (int pageIndex) {
            setState(() {
              _selectePage = pageIndex;
            });
          },
        ),
        body: _pageIndex[_selectePage]);
  }
}
