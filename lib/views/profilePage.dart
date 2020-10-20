import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
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
  String selectedActivity;
  String activityDescription = '';
  List activityList = ['Camp', 'smth']; 
  List<DynamicCard> cardList = [];
  bool isReadOnly = true;
  bool addWidget = false;

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
                      TextStyle(fontSize: 5 * SizeConfig.blockSizeHorizontal),
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

  addCard(){
    cardList = [];
    setState(() {
      cardList.add(new DynamicCard());
    });
  }

  _fillCardDialog(context){
    return    Alert(
        context: context,
        title: "Add activity",
        content: Column(
          children: <Widget>[
            DropdownButton(
              hint: Text('Select your activity'),
              icon: Icon(Icons.arrow_drop_down),
              value: selectedActivity,
              onChanged: (value){
                setState(() {
                  value = selectedActivity; //TODO Why dropdown doesn't update value, it still shows the old one     
                  print(value);  //TODO It is null, why?             
                });
              },
              //value: selectedActivity,
              items: activityList.map((value) {
                return DropdownMenuItem(
                  value: value, 
                  child: Text(value));
              }).toList() 
              ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Where',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              activityDescription = '1234';  
             
              Navigator.pop(context);
              },
            child: Text(
              "Add Activity",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

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
                              child: TextField( //TODO: Need to fix bioBox
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
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.add),
                  label: Text('Add Activities'),
                  onPressed: (){
                   _fillCardDialog(context);
                    addWidget = true;
                  }, 
                  ),
                  if(addWidget)
                     Container(
                      child: createActivityCard('Added by user', 'WE DID IT')), //TODO We have to change this in order to work properly with data from db - Implement new listViewActivity.dart
              ],
            ))
      ],
      
    )
    );
  }
}