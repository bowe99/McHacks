import 'package:flutter/material.dart';
import 'package:recycling_app/screens/item_screen.dart';
import 'package:recycling_app/screens/item_tabs_screen.dart';
import 'package:recycling_app/screens/recycle_screen.dart';

import 'package:recycling_app/screens/scan_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recycle App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.purple,
        textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(122, 122, 122, 1),
                  fontSize: 24,
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        ItemScreen.routeName: (ctx) => ItemScreen(),
        ItemTabScreen.routeName: (ctx) => ItemTabScreen(),
        RecycleScreen.routeName: (ctx) => RecycleScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => ScanScreen(),
        );
      },
    );
  }
}
