import 'package:flutter/material.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'db_item_screen.dart';
import 'db_product_list_screen.dart';
import 'db_project_list_screen.dart';
import 'db_recycle_screen.dart';

class DBItemTabScreen extends StatefulWidget {
  static const routeName = '/db-item-tabs';
  @override
  _DBItemTabScreenState createState() => _DBItemTabScreenState();
}

class _DBItemTabScreenState extends State<DBItemTabScreen> {
  List<Map<String, Object>> _pages = [
    {
      'page': DBItemScreen(),
      'title': 'Item Dashboard',
    },
    {
      'page': DBRecycleScreen(),
      'title': 'Recycle',
    },
    {
      'page': DBProjectListScreen(),
      'title': 'Reuse',
    },
    {
      'page': DBProductListScreen(),
      'title': 'Reduce',
    }
  ];
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'],
            style: Theme.of(context).textTheme.bodyText2),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.lightGreen[900], Colors.lime[200]])),
        ),
      ),
      body: SingleChildScrollView(child: _pages[_selectedPageIndex]['page']),
      bottomNavigationBar: GradientBottomNavigationBar(
        onTap: _selectPage,
        backgroundColorStart: Colors.lightGreen[900],
        backgroundColorEnd: Colors.lime[200],
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            title: Text(
              'Dashboard',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.recycle,
            ),
            title: Text(
              'Recycle',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.find_replace,
            ),
            title: Text(
              'Reuse',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.trending_down,
            ),
            title: Text(
              'Reduce',
            ),
          ),
        ],
      ),
    );
  }
}
