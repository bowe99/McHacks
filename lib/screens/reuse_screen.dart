import 'package:flutter/material.dart';
import 'package:recycling_app/models/project.dart';
import 'package:recycling_app/widgets/project_item.dart';

class ReuseScreen extends StatefulWidget {
  static const routeName = '/reuse';
  @override
  _ReuseScreenState createState() => _ReuseScreenState();
}

class _ReuseScreenState extends State<ReuseScreen> {
  @override
  Widget build(BuildContext context) {
    final project = ModalRoute.of(context).settings.arguments as Project;

    return Scaffold(
      appBar: AppBar(
        title: Text(project.name),
      ),
      body: ProjectItem(
          description: project.descritption,
          name: project.name,
          url: project.url),
    );
  }
}
