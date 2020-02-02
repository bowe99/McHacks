import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import 'package:recycling_app/models/item.dart';

class ReduceScreen extends StatefulWidget {
  @override
  _ReduceScreenState createState() => _ReduceScreenState();
}

class _ReduceScreenState extends State<ReduceScreen> {
  @override
  Widget build(BuildContext context) {
    final itemFound = ModalRoute.of(context).settings.arguments as Item;
    final itemProducts = itemFound.listProducts[0];
    return SingleChildScrollView(
      child: ProductItem(
          description: itemProducts.description,
          name: itemProducts.name,
          imgURL: itemProducts.url),
    );
  }
}
