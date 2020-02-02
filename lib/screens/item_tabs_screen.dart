import 'package:flutter/material.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:recycling_app/screens/projects_list_screen.dart';
import 'package:recycling_app/widgets/product_list_item.dart';

import './item_screen.dart';
import './recycle_screen.dart';
import './reduce_screen.dart';
import './reuse_screen.dart';
import 'product_list_screen.dart';

class ItemTabScreen extends StatefulWidget {
  static const routeName = '/item-tabs';
  @override
  _ItemTabScreenState createState() => _ItemTabScreenState();
}

class _ItemTabScreenState extends State<ItemTabScreen> {
  List<Map<String, Object>> _pages = [
    {
      'page': ItemScreen(),
      'title': 'Item Dashboard',
    },
    {
      'page': RecycleScreen(),
      'title': 'Recycle',
    },
    {
      'page': ProjectListScreen(),
      'title': 'Reuse',
    },
    {
      'page': ProductListScreen(),
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
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: Theme.of(context).textTheme.body2
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin:Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.lightGreen[900],
                Colors.lime[200]
              ]
            )
          ),
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
