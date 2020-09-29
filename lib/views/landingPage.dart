import 'package:wildnature/views/faunaInfo.dart';
import 'package:wildnature/views/hikePaths.dart';
import 'package:wildnature/views/homePage.dart';
import 'package:flutter/material.dart';
import 'package:wildnature/views/profilePage.dart';
import 'package:wildnature/widgets/sizeConfig.dart';
import 'settingsPage.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPage createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {
  final Color activeIconColor = Color.fromRGBO(22, 174, 155, 1);
  int _selectePage = 0;
  final _pageIndex = [
    HikePage(),
    FaunaInfoPage(),
    HomePage(),
    ProfilePage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        bottomNavigationBar: ConvexAppBar(
          activeColor: activeIconColor,
          color: Colors.grey[300],
          height: 40,
          curveSize: 60,
          backgroundColor: Colors.white54,
          style: TabStyle.textIn,
          items: [
            TabItem(icon: Icons.map, title: 'Hike Paths'),
            TabItem(icon: Icons.info, title: 'Fauna Info'),
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.person, title: 'Profile'),
            TabItem(icon: Icons.settings, title: 'Settings'),
          ],
          initialActiveIndex: 3,
          onTap: (int pageIndex) {
            setState(() {
              _selectePage = pageIndex;
            });
          },
        ),
        body: _pageIndex[_selectePage]);
  }
}
