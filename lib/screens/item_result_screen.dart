import 'package:flutter/material.dart';
import 'package:recycling_app/models/item.dart';
import 'package:recycling_app/widgets/item_list_widget.dart';

import 'item_tabs_screen.dart';

class ItemResultScreen extends StatelessWidget {
  static const routeName = '/item-results';

  void goToIndividualPage(BuildContext context, Item item) {
    Navigator.of(context).pushNamed(ItemTabScreen.routeName, arguments: item);
  }

  @override
  Widget build(BuildContext context) {
    final foundItemsAndCategories =
        ModalRoute.of(context).settings.arguments as Map;
    final foundItems = foundItemsAndCategories['itemList'] as List<Item>;
    final nameSearch =
        foundItemsAndCategories['name'] as String;
    final List<Item> matches = [];

    for (var item in foundItems) {
      if(nameSearch == item.name){
        matches.add(item);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Items Found', style: Theme.of(context).textTheme.bodyText2),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.lightGreen[900], Colors.lime[200]])),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        height: MediaQuery.of(context).size.height * 0.7,
        child: ListView(
            children: matches.map((item) {
          return ItemListWidget(item.name, () {
            goToIndividualPage(context, item);
          });
        }).toList()),
      ),
    );
  }
}
