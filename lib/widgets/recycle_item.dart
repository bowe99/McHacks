import 'package:flutter/material.dart';
import 'package:recycling_app/models/recycle.dart';

class RecycleItem extends StatelessWidget {
  final Recycle recycleObj;

  RecycleItem(this.recycleObj);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          child: Text(
            'Help',
          ),
        ));
  }
}
