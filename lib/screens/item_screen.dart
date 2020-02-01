import 'package:flutter/material.dart';

import '../widgets/item_widget.dart';

class ItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: ItemWidget(),
    );
  }
}