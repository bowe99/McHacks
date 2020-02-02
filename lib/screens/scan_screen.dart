import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recycling_app/models/item.dart';
import 'package:recycling_app/screens/item_tabs_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/item.dart';

import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';

import '../models/products.dart';
import '../models/products.dart';
import '../models/products.dart';
import '../models/project.dart';
import '../models/recycle.dart';
import '../models/recycle.dart';


class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

Future<DocumentSnapshot> getItem(id){
    return Firestore.instance.collection('items').document(id).get()
        .then((DocumentSnapshot ds) {
          return ds;
    });
}

Future<DocumentSnapshot> getProject(id){
    return Firestore.instance.collection('projects').document(id).get()
        .then((DocumentSnapshot ds) {
          return ds;
    });
}

Future<DocumentSnapshot> getProduct(id){
    return Firestore.instance.collection('products').document(id).get()
        .then((DocumentSnapshot ds) {
          return ds;
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
            List<Project> allProjects = List();
            List<Product> allProducts = List(); 


            // Get Projects
            foundItem['projects'].forEach((elm) async{
              DocumentSnapshot foundProject = await getProject(elm);
              allProjects.add(Project(name: foundProject['name'], url: foundProject['videoURL'], descritption: foundProject['description']));
            });

            // Get Products
            foundItem['products'].forEach((elm) async{
              DocumentSnapshot foundProduct = await getProduct(elm);
              allProducts.add(Product(name: foundProduct['name'], url: foundProduct['imageURL'], description: foundProduct['description'],
              price: foundProduct['price'], link: foundProduct['link']));
            });

            List<String> instructions = [];
            
            foundItem['recycle']['instructions'].forEach((elm) {
              instructions.add(elm);
            });

            Recycle recycleFound =  Recycle(type: foundItem['recycle']['type'], instructions: instructions);

            Item item = Item(name: foundItem['name'], category: foundItem['category'], id: foundItem['name'], url: foundItem['imageURL'],
            listProjects: allProjects, listProducts: allProducts, recycleInfo: recycleFound);
            print(instructions);
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
        setState(() {
          result = "Unknown Error $e";
        });
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
