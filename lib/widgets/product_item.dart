import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final String imgURL;
  final String description;
  final String price;
  final String link;

  const ProductItem({
    this.name,
    this.imgURL,
    this.description,
    this.price,
    this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Image.network(imgURL),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                name,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.lightGreen[900],
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Description: $description',
                  style: TextStyle(color: Colors.lightGreen[900]),
                ),
                Text(
                  'Price: $price',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  'Name: $name',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  'Link: $link',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
