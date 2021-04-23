import 'package:flutter/material.dart';
import 'package:recycling_app/models/db_item.dart';
import 'package:recycling_app/models/item.dart';
import 'package:recycling_app/models/recycle.dart';

class DBRecycleScreen extends StatelessWidget {
  static const routeName = '/recycle-item';

  @override
  Widget build(BuildContext context) {
    final itemFound = ModalRoute.of(context).settings.arguments as DBItem;
    Recycle recycleInfo = itemFound.recycleInfo;
    return Container(
      padding: EdgeInsets.all(30), 
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(40), 
            child: Text(recycleInfo.type, style: 
                    TextStyle(fontFamily: 'Montserrat-SemiBold', color: Colors.lightGreen[900], fontSize: 32)),
          ),
          Column(
          //   ...recycleInfo.instructions.map().forEach( (instruction) {
          //     Text(instruction)
          //   }
          // ).toList()
          children: recycleInfo.instructions.map((location){ 
                return Container(
                  padding: EdgeInsets.all(20), 
                  child: Text(
                    location,
                    style: TextStyle(fontFamily: 'Montserrat-SemiBold', color: Colors.lightGreen[900], fontSize: 24)
                  ),
                );
                
                }
              ).toList(),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Image.asset('assets/recycle3.png', fit:
                      BoxFit.scaleDown)
          ),
        ],
      ),
    );
  }
}