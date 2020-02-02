import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:recycling_app/models/item.dart';
import 'package:recycling_app/screens/item_tabs_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../dummy_data.dart';
import '../models/item.dart';

import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';


class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

Future<DocumentSnapshot> getItem(id){
    return Firestore.instance.collection('items').document(id).get()
        .then((DocumentSnapshot ds) {
          return ds;
        //   this.test = ds;
        // this.name = ds['name'];
        // this.imgURL = ds['imageURL'];
        // this.category = ds['category'];
        // this.brand = ds['brand'];
        // this.packagesize = ds['packagesize'];
        // this.material = ds['material'];
        // ds['products'].forEach((elm){
        //   Firestore.instance.collection('products').document(elm).get().then((DocumentSnapshot fs){
        //     products.add({"value": "dsd"});
        //   });
        // });
    });
}


class _ScanScreenState extends State<ScanScreen> {
  String result = 'No Result yet';
  File imageFile;
  int findItem = 0;

  // Open the Camera App
  Future getImageFile() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = image;
    });
  }

  // Detect items
  Future detectImageLabels(FirebaseVisionImage visionImage, ImageLabeler cloudLabeler) async {
    List<ImageLabel> cloudLabels;
    try {
      cloudLabels = await cloudLabeler.processImage(visionImage);
      if(cloudLabels.length == 0){
        findItem = 2;
      }else{
        List<String> values = new List();
        for (ImageLabel label in cloudLabels) {
          final String text = label.text;
          values.add(text);
          print(text);
        }
        return values;
      }
    } catch (e) {
      print(e.toString());
    } finally {
      cloudLabeler.close();
    }
    return cloudLabels;
  }

  // Detect Barcode
  detectBarCodes(FirebaseVisionImage visionImage, BarcodeDetector barcodeDetector) async {
    try {
      final List<Barcode> barCodes = await barcodeDetector.detectInImage(visionImage);
      if(barCodes.length == 0){
        findItem = 1;
      }else{
        return (barCodes[0].rawValue);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      barcodeDetector.close();
    }
  }

  @override
  Future _scanBarcode() async {
    try {
      Future _labelImage() async {
          await getImageFile();
          final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(imageFile);
          final BarcodeDetector barcodeDetector = FirebaseVision.instance.barcodeDetector();
          final ImageLabeler cloudLabeler = FirebaseVision.instance.cloudImageLabeler(CloudImageLabelerOptions(confidenceThreshold: 0.9));
          
          String foundValue = (await detectBarCodes(visionImage, barcodeDetector));

          // Barcode not found, try image labeling
          if(findItem == 1){
            await detectImageLabels(visionImage, cloudLabeler);
            if(findItem == 2){
              setState(() {
                result = "Notion found!";
              });
            }else{
              setState(() {
                  result = "Found Item.....";
              });
            }
          // Add item that was found with the barcode
          }else{
            DocumentSnapshot foundItem = await getItem(foundValue);
            Item item = new Item(name: foundItem['name'], category: foundItem['category'], id: foundItem['name'], url: foundItem['imageURL']);
            Navigator.of(context).pushNamed(
              ItemTabScreen.routeName,
              arguments: item,
            );
            setState(() {
              result = foundValue;
            });
          }
        }
        await _labelImage();
        print(result);
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
