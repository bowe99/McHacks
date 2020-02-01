import 'package:flutter/material.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';

import './scan_screen.dart';
import './search_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [
    {
      'page': ScanScreen(),
      'title': 'Scan',
    },
    {
      'page': SearchScreen(),
      'title': 'Search',
    },
  ];
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  int _selectedPageIndex = 0;
  
  @override
  Widget build(BuildContext context) {



        Map<int, Color> color =
{
50:Color.fromRGBO(4,131,184, .1),
100:Color.fromRGBO(4,131,184, .2),
200:Color.fromRGBO(4,131,184, .3),
300:Color.fromRGBO(4,131,184, .4),
400:Color.fromRGBO(4,131,184, .5),
500:Color.fromRGBO(4,131,184, .6),
600:Color.fromRGBO(4,131,184, .7),
700:Color.fromRGBO(4,131,184, .8),
800:Color.fromRGBO(4,131,184, .9),
900:Color.fromRGBO(4,131,184, 1),
};

MaterialColor myColor = MaterialColor(0xC4CE91, color);
MaterialColor myOtherColor = MaterialColor(0x849B73, color);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _pages[_selectedPageIndex]['title'],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin:Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.lime[200],
                Colors.lightGreen[900]
              ]
            )
          ),
        ),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: GradientBottomNavigationBar(
        
        onTap: _selectPage,
        backgroundColorStart: Colors.lime[200],
        backgroundColorEnd: Colors.lightGreen[900],
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
            ),
            title: Text(
              'Scan',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            title: Text(
              'Search',
            ),
          ),
        ],
      ),
    );
  }
}
