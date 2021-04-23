import 'package:flutter/material.dart';
import 'package:recycling_app/models/db_item.dart';
import 'package:recycling_app/models/item.dart';
import 'package:recycling_app/models/project.dart';
import 'package:recycling_app/screens/reuse_screen.dart';
import 'package:recycling_app/widgets/project_item_list.dart';

class DBProjectListScreen extends StatelessWidget {
 
 void goToIndividualPage(BuildContext context, Project project){
   Navigator.of(context).pushNamed(
     ReuseScreen.routeName,
     arguments: project,

   );
 }
 
 
 @override
  Widget build(BuildContext context) {
    final foundItem = ModalRoute.of(context).settings.arguments as DBItem;
    final foundProjects = foundItem.listProjects;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView(
        children: foundProjects.map((project) {
          return ProjectsListItem(project.name, () {
            goToIndividualPage(context, project);
          });
        }).toList()
      ),
    );
  }
}