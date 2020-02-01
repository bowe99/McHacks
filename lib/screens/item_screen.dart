import 'package:flutter/material.dart';
import 'package:recycling_app/models/item.dart';

import '../widgets/item_widget.dart';

class ItemScreen extends StatelessWidget {
  static const routeName = '/item-dashboard';

  @override
  Widget build(BuildContext context) {
    final itemFound = ModalRoute.of(context).settings.arguments as Item;
    return ItemWidget(
      barCode: itemFound.id,
      brand: itemFound.brand,
      material: itemFound.material,
      name: itemFound.name,
      packageSize: itemFound.packageSize,
      url: itemFound.url,
      category: itemFound.category,
    );
  }
}
