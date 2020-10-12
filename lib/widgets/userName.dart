import 'package:flutter/material.dart';
import 'package:wildnature/services/databaseService.dart';
import 'package:wildnature/utils/textStyle.dart';
import 'package:wildnature/widgets/sizeConfig.dart';

class UserName extends StatelessWidget {
  const UserName({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
          future: DatabaseService().getUserName(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return Text(snapshot.data, style: MyTextStyle(color: Colors.white, fontWeight: FontWeight.normal, size: 4 * SizeConfig.blockSizeHorizontal),);
            } else{
              return Text('no connections');
            }
          }                        
        );
  }
}