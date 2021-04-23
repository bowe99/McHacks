import 'package:flutter/material.dart';
import 'package:recycling_app/models/db_item.dart';
import 'package:recycling_app/widgets/db_item_widget.dart';


class DBItemScreen extends StatelessWidget {
  static const routeName = '/item-dashboard';

  @override
  Widget build(BuildContext context) {
    final itemFound = ModalRoute.of(context).settings.arguments as DBItem;
    return DBItemWidget(
      barCode: itemFound.barcode,
      name: itemFound.name,
      category: itemFound.categories,
    );
  }
}
