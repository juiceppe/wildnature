import 'package:flutter/material.dart';
import 'package:wildnature/services/authService.dart';
import 'package:provider/provider.dart';
import 'package:wildnature/services/databaseService.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Settings"),
            RaisedButton(
              child: Text("Get UserId"),
              onPressed: () {
                DatabaseService().getUserName();
              },
            ),
            RaisedButton(
              child: Text("Sign Out"),
              onPressed: () {
                context.read<AuthenticationService>().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
