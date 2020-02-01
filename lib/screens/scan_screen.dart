import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:recycling_app/screens/item_screen.dart';

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
      Navigator.of(context).pushNamed(
        ItemScreen.routeName,
      );
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 500,
          padding: EdgeInsets.all(30),
          child: Center(
            child: Text(
              result,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: FloatingActionButton.extended(
            onPressed: _scanBarcode,
            icon: Icon(Icons.camera_alt),
            label: Text('Scan'),
          ),
        )
      ],
    );
  }
}
