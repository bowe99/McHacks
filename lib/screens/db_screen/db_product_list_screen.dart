import 'package:flutter/material.dart';
import 'package:recycling_app/models/db_item.dart';
import 'package:recycling_app/models/item.dart';
import 'package:recycling_app/models/products.dart';
import 'package:recycling_app/screens/reduce_screen.dart';
import 'package:recycling_app/widgets/product_list_item.dart';
import 'package:recycling_app/widgets/project_item_list.dart';

class DBProductListScreen extends StatelessWidget {
 
 void goToIndividualPage(BuildContext context, Product product){
      Navigator.of(context).pushNamed(
        ReduceScreen.routeName,
        arguments: product 

   );
 }
 
 
 @override
  Widget build(BuildContext context) {
    final foundItem = ModalRoute.of(context).settings.arguments as DBItem;
    final foundProducts = foundItem.listProducts;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView(
        children: foundProducts.map((product) {
          return ProductListItem(product.name, () {
            goToIndividualPage(context, product);
          });
        }).toList()
      ),
    );
  }
}