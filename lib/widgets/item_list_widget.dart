import 'package:flutter/material.dart';

class ItemListWidget extends StatelessWidget {
  final String title;
  final Function navigate;

  ItemListWidget(this.title, this.navigate);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        ListTile(
          leading: Icon(Icons.dashboard),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onTap: navigate,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}