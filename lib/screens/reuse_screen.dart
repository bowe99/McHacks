import 'package:flutter/material.dart';
import 'package:recycling_app/models/item.dart';
import 'package:recycling_app/widgets/project_item.dart';

class ReuseScreen extends StatefulWidget {
  @override
  _ReuseScreenState createState() => _ReuseScreenState();
}

class _ReuseScreenState extends State<ReuseScreen> {
  @override
  Widget build(BuildContext context) {
    final itemFound = ModalRoute.of(context).settings.arguments as Item;
    final itemProjects = itemFound.listProjects[0];
    return ProjectItem(
      description: itemProjects.descritption,
      name: itemProjects.name,
      url: itemProjects.url,
    );
  }
}
