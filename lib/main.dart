import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = 'Barcode Test for McHacks';

  Future _scanBarcode() async {
    try {
      String barcodeResult = await BarcodeScanner.scan();
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Barcode Scanner',
        ),
      ),
      body: Container(
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
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(
          Icons.camera_alt,
        ),
        onPressed: _scanBarcode,
        label: Text('Scan'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
