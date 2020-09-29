import 'package:flutter/material.dart';

class HikePage extends StatefulWidget {
  HikePage({Key key}) : super(key: key);

  @override
  _HikePageState createState() => _HikePageState();
}

class _HikePageState extends State<HikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Paths"),
      ),
    );
  }
}
