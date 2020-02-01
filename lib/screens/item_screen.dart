import 'package:flutter/material.dart';

import '../widgets/item_widget.dart';

class ItemScreen extends StatelessWidget {
  static const routeName = '/item-dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(child: Text('Next Page'),),
    );
  }
}