import 'package:flutter/material.dart';
import 'package:recycling_app/screens/item_list_screen.dart';
import 'package:recycling_app/screens/item_result_screen.dart';
import 'package:recycling_app/screens/item_tabs_screen.dart';
import 'package:flutter/services.dart';
import 'package:recycling_app/screens/reduce_screen.dart';
import 'package:recycling_app/screens/reuse_screen.dart';

import 'package:recycling_app/screens/scan_screen.dart';
import './screens/tabs_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  runApp(HomePage());
}

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
        accentColor: Colors.lightGreen[900],
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                fontFamily: 'Montserrat-Regular',
                color: Colors.lightGreen[900],
                fontSize: 18,
              ),
              bodyText2: TextStyle(
                fontFamily: 'Montserrat-Regular',
                color: Colors.white,
                fontSize: 26,
              ),
              headline6: TextStyle(fontFamily: 'Montserrat-SemiBold', fontSize: 32),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        ItemTabScreen.routeName: (ctx) => ItemTabScreen(),
        ReuseScreen.routeName: (ctx) => ReuseScreen(),
        ReduceScreen.routeName: (ctx) => ReduceScreen(),
        ItemListScreen.routeName: (ctx) => ItemListScreen(),
        ItemResultScreen.routeName: (ctx) => ItemResultScreen(),
      },
    );
  }
}
