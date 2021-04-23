import 'package:flutter/material.dart';

class DBItemWidget extends StatelessWidget {
  final String barCode;
  final String name;
  final List<dynamic> category;

  DBItemWidget({
    @required this.barCode,
    @required this.name,
    @required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(width: double.infinity, alignment: Alignment.center, child: Image.asset('assets/recycle1.png')),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                name,
                textAlign: TextAlign.left,
                style: TextStyle( color: Colors.lightGreen[900], fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 45,
                ),
                height: 250,
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Category: $category',
                      style: TextStyle( color: Colors.lightGreen[900]),
                    ),
                    Text(
                      'Barcode: $barCode',
                      style: TextStyle( color: Colors.lightGreen[900]),
                    ),
                  ],
                ),
              ),
            
            
          ],
        ),
      ],
    );
  }
}
