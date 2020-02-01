import 'package:flutter/material.dart';
import 'package:recycling_app/screens/item_screen.dart';

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
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        '/item-dashboard': (ctx) => ItemScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => ScanScreen(),
        );
      },
    );
  }
}
