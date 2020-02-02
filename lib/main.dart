import 'package:flutter/material.dart';
import 'package:recycling_app/screens/item_tabs_screen.dart';
import 'package:flutter/services.dart';

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
              body1: TextStyle(
                fontFamily: 'Montserrat-Regular',
                color: Colors.lightGreen[900],
                fontSize: 18,
              ),
              body2: TextStyle(
                fontFamily: 'Montserrat-Regular',
                color: Colors.white,
                fontSize: 26,
              ),
              title: TextStyle(fontFamily: 'Montserrat-SemiBold', fontSize: 32),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        ItemTabScreen.routeName: (ctx) => ItemTabScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => ScanScreen(),
        );
      },
    );
  }
}
