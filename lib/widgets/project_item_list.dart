import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class ProjectsListItem extends StatelessWidget {
  final String title;
  final Function navigate;

  ProjectsListItem(this.title, this.navigate);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        ListTile(
          leading: Icon(LineAwesomeIcons.tasks),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onTap: navigate,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
