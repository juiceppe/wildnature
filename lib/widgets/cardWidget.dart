import 'package:flutter/material.dart';
import 'package:wildnature/widgets/sizeConfig.dart';

class DynamicCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 350,
      child: Card(
        elevation: 6,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              title: Text('Last Activity:'),
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Juiceppe camped in Aarhus C',
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
}
