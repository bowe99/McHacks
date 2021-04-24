import 'package:flutter/material.dart';
import 'package:recycling_app/models/products.dart';
import '../widgets/product_item.dart';
import 'package:recycling_app/models/item.dart';

class ReduceScreen extends StatefulWidget {
  static const routeName = '/reduce';

  @override
  _ReduceScreenState createState() => _ReduceScreenState();
}

class _ReduceScreenState extends State<ReduceScreen> {
  @override
  Widget build(BuildContext context) {
    final productFound = ModalRoute.of(context).settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          productFound.name,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.lightGreen[900], Colors.lime[200]])),
        ),
      ),
      body: SingleChildScrollView(
        child: ProductItem(
          description: productFound.description,
          name: productFound.name,
          imgURL: productFound.url,
        ),
      ),
    );
  }
}
