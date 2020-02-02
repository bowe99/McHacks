import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:recycling_app/models/item.dart';
import 'package:recycling_app/screens/item_tabs_screen.dart';

import '../dummy_data.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String result = 'No Result yet';

  @override
  Future _scanBarcode() async {
    try {
      String barcodeResult = await BarcodeScanner.scan();
      Item foundItem =
          DUMMY_ITEMS.firstWhere((item) => item.id == barcodeResult);
      if (foundItem != null) {
        Navigator.of(context).pushNamed(
          ItemTabScreen.routeName,
          arguments: foundItem,
        );
      }
      setState(() {
        result = barcodeResult;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = 'Camera Permission Denied';
        });
      } else {
        setState(() {
          result = "Unknown Error $e";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning something.";
      });
    } catch (e) {
      setState(() {
        result = "Unknown Error $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 400,
            padding: EdgeInsets.all(30),
            child: Image.asset('assets/logo-01.png', fit:
            BoxFit.scaleDown),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: FloatingActionButton.extended(
              backgroundColor: Colors.lightGreen[800],
              onPressed: _scanBarcode,
              icon: Icon(Icons.camera_alt),
              label: Text('Scan', 
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  color: Colors.white,
                  fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
