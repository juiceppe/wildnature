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

  Widget createActivityCard(String activy, String activityDesc){
    return SizedBox(
      height: 250,
      width: 350,
      child: Card(
        elevation: 6,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              title: Text(activy),
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  activityDesc,
                  style:
                      TextStyle(fontSize: 5),
                )),
            Container(
              width: 200,
              height: 160,
              child: Image.asset('assets/camping.png', fit: BoxFit.fill),
            )
          ],
        ),
      ),
    );
  }
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
              child: Text("Get Bio"),
              onPressed: () {
                DatabaseService().getUserBio();
              },
            ),
            RaisedButton(
              child: Text("Update Bio"),
              onPressed: () {
                DatabaseService().updateBio('ciao');
              },
            ),
             RaisedButton(
              child: Text("Dynamic Widget Test"),
              onPressed: () {
               createActivityCard('activy', 'activityDesc');
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
