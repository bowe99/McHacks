import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final String title;
  final Function navigate;

  ProductListItem(this.title, this.navigate);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        ListTile(
          leading: Icon(Icons.store),
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
