import 'package:flutter/material.dart';
import 'package:recycling_app/models/item.dart';
import 'package:recycling_app/models/recycle.dart';

class RecycleScreen extends StatelessWidget {
  static const routeName = '/recycle-item';

  @override
  Widget build(BuildContext context) {
    final itemFound = ModalRoute.of(context).settings.arguments as Item;
    Recycle recycleInfo = itemFound.recycleInfo;
    return Column(
      children: <Widget>[
        Text(recycleInfo.type),
        Column(
        //   ...recycleInfo.instructions.map().forEach( (instruction) {
        //     Text(instruction)
        //   }
        // ).toList()
        children: recycleInfo.instructions.map((location){ 
              return Text(
                location
              );}
            ).toList(),
        
        
        )
      ],
    );
  }
}