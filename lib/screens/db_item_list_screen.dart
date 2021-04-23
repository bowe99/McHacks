import 'package:flutter/material.dart';
import 'package:recycling_app/models/db_item.dart';
import 'package:recycling_app/models/item.dart';
import 'package:recycling_app/screens/item_tabs_screen.dart';
import 'package:recycling_app/widgets/item_list_widget.dart';

class DBItemListScreen extends StatelessWidget {
  static const routeName = '/db-item-list';

  @override
  Widget build(BuildContext context) {
    final foundItemsAndCategories =
        ModalRoute.of(context).settings.arguments as Map;
    final foundItems = foundItemsAndCategories['itemList'] as List<dynamic>;

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Items Found', style: Theme.of(context).textTheme.bodyText2),
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
        child: ListView.builder(
          itemCount: foundItems.length,
          itemBuilder: (context, index) {
            return ItemListWidget(foundItems[index].name, () {});
          },
        ),
      ),
    );
  }
}
