import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String barCode;
  final String name;
  final String url;
  final String brand;
  final String packageSize;
  final String material;

  ItemWidget({
    @required this.barCode,
    @required this.brand,
    @required this.material,
    @required this.name,
    @required this.packageSize,
    @required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(url),
        Text(
          name,
        ),
        Text(
          brand,
        ),
        Text(
          barCode,
        ),
        Text(
          packageSize,
        ),
        Text(
          material,
        ),
      ],
    );
  }
}
