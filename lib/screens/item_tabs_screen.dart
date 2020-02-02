import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import './item_screen.dart';
import './recycle_screen.dart';
import './reduce_screen.dart';
import './reuse_screen.dart';

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
      'page': ReuseScreen(),
      'title': 'Reuse',
    },
    {
      'page': ReduceScreen(),
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
        ),
      ),
      body: SingleChildScrollView(
        child: _pages[_selectedPageIndex]['page'],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.dashboard,
            ),
            title: Text(
              'Dashboard',
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              LineAwesomeIcons.recycle,
            ),
            title: Text(
              'Recycle',
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.find_replace,
            ),
            title: Text(
              'Reuse',
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
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
