import 'package:flutter/material.dart';

class FaunaInfoPage extends StatefulWidget {
  FaunaInfoPage({Key key}) : super(key: key);

  @override
  _FaunaInfoPageState createState() => _FaunaInfoPageState();
}

class _FaunaInfoPageState extends State<FaunaInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Fauna"),
      ),
    );
  }
}
