import 'package:flutter/material.dart';
import 'package:wildnature/services/databaseService.dart';
import 'package:wildnature/widgets/cardWidget.dart';
import 'package:wildnature/widgets/sizeConfig.dart';
import 'package:wildnature/widgets/userName.dart';
import 'package:wildnature/widgets/userBio.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Color dominantBg = Color.fromRGBO(143, 196, 186, 1);
  TextEditingController bioController = TextEditingController();
  String editBio = 'EDIT BIO';
  String bioText = '';
  bool isReadOnly = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: dominantBg,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 7))
            ],
          ),
          height: 40 * SizeConfig.blockSizeVertical,
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 10 * SizeConfig.blockSizeVertical,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('assets/avatar.png'),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(width: 5 * SizeConfig.blockSizeHorizontal),
                      Column(
                        children: <Widget>[
                          UserName(),
                          SizedBox(
                            height: 2 * SizeConfig.blockSizeVertical,
                          ),
                          Container(
                            height: 10 * SizeConfig.blockSizeVertical,
                            width: 40 * SizeConfig.blockSizeHorizontal,
                            child: Center(
                              child: TextField(
                                controller: bioController,
                                readOnly: isReadOnly,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.only(right: 60),
                                    child: UserBio()
                                  )
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1 * SizeConfig.blockSizeVertical,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10 * SizeConfig.blockSizeHorizontal, top: 20),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "21.2K",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 5 * SizeConfig.blockSizeHorizontal,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 4 * SizeConfig.blockSizeHorizontal),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10 * SizeConfig.blockSizeHorizontal, top: 20),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "500",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 5 * SizeConfig.blockSizeHorizontal,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text(
                              "Following",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 4 * SizeConfig.blockSizeHorizontal),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 9 * SizeConfig.blockSizeHorizontal, top: 20),
                      child: Container(
                        height: 5 * SizeConfig.blockSizeVertical,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white60),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              if(editBio == 'EDIT BIO'){
                                editBio = 'Save Bio';
                                isReadOnly = false;
                                } else {
                                  bioText = bioController.text;
                                  DatabaseService().updateBio(bioText);
                                  editBio = 'EDIT BIO';
                                  isReadOnly = true;
                                  bioController.clear();
                                }
                            });
                          },
                          child: Text(
                            editBio,
                            style: TextStyle(color: Colors.white60),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
                left: 5 * SizeConfig.blockSizeHorizontal,
                right: 5 * SizeConfig.blockSizeHorizontal,
                top: 50 * SizeConfig.blockSizeVertical,
                bottom: 4 * SizeConfig.blockSizeVertical),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [ProfileCard(), SizedBox(width: 10), ProfileCard()],
            ))
      ],
    ));
  }
}