import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recycling_app/models/item.dart';
import 'package:recycling_app/screens/item_list_screen.dart';
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
  static const itemList = [
    Item(
      name: 'V8 Vegetable Cocktail',
      category: 'Beverage can',
      id: '06311055702',
      url:
          'https://firebasestorage.googleapis.com/v0/b/recyclemchacks.appspot.com/o/items%2Fv8.jpeg?alt=media&token=10768585-9de1-4f18-86e2-a81e326b1a12',
      brand: 'Campbells',
      material: 'Aluminium',
      packageSize: 'Small',
      recycleInfo: Recycle(
        type: 'Metal #2',
        instructions: ['Wash the Can', 'Dry the Can', 'Send to Bin'],
      ),
      listProducts: [
        Product (
          name: 'Reusable Can',
          description: 'Reusable Can',
          url:
              'https://firebasestorage.googleapis.com/v0/b/recyclemchacks.appspot.com/o/products%2Fresuablecan.jpg?alt=media&token=5e36c6a1-8e24-41d7-aee0-878d7acf022c',
        )
      ],
      listProjects: [
        Project(
          name: 'Reuse Soda Can',
          descritption: 'Use Soda Cans for a variety of fun purposes!',
          url:
              'https://firebasestorage.googleapis.com/v0/b/recyclemchacks.appspot.com/o/videos%2Fbig_buck_bunny.mp4?alt=media&token=024d702e-9e51-436d-94a5-21891d951aa8',
        )
      ],
    ),
    
 Item(
      name: 'Green Apple',
      category: 'Fruit',
      id: 'YP7YXe8gfk0ebYTU3F5W',
      url:
          'https://firebasestorage.googleapis.com/v0/b/recyclemchacks.appspot.com/o/items%2Fapples.png?alt=media&token=9730ea2e-685c-41b7-b650-7d7f5bb726ab',
      brand: 'NA',
      material: 'Organic',
      packageSize: 'Small',
      recycleInfo: Recycle(
        type: 'Compost',
        instructions: ['Throw core into any compost bin!', 'Or make your own compost at home!'],
      ),
      listProducts: [
        Product (
          name: '',
          description: '',
          url:
              'https://firebasestorage.googleapis.com/v0/b/recyclemchacks.appspot.com/o/products%2Fresuablecan.jpg?alt=media&token=5e36c6a1-8e24-41d7-aee0-878d7acf022c',
        )
      ],
      listProjects: [
        Project(
          name: 'Plant a tree!',
          descritption: 'Save apple seeds and start your own orchard!',
          url:
             'https://q7i2y6d5.stackpathcdn.com/wp-content/uploads/2012/08/apple-tree1-400x534.jpg',
        )
      ],
    )
  ];
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

Future<DocumentSnapshot> getItem(id) {
  return Firestore.instance
      .collection('items')
      .document(id)
      .get()
      .then((DocumentSnapshot ds) {
    print(ds);
    return ds;
  });
}

Future<DocumentSnapshot> getCategory(fieldpath) {
  return Firestore.instance
      .collection('items')
      .document(fieldpath)
      .get()
      .then((DocumentSnapshot ds) {
    print(ds);
    return ds;
  });
}

Future<DocumentSnapshot> getProject(id) {
  return Firestore.instance
      .collection('projects')
      .document(id)
      .get()
      .then((DocumentSnapshot ds) {
    return ds;
  });
}

Future<DocumentSnapshot> getProduct(id) {
  return Firestore.instance
      .collection('products')
      .document(id)
      .get()
      .then((DocumentSnapshot ds) {
    return ds;
  });
}

class _ScanScreenState extends State<ScanScreen> {
  
  String result = 'No Result yet';
  File imageFile;
  int findItem = 0;

  // Open the Camera App
  Future getImageFile() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = image;
    });
  }

  // Detect items
  Future detectImageLabels(
      FirebaseVisionImage visionImage, ImageLabeler cloudLabeler) async {
    List<ImageLabel> cloudLabels;
    try {
      cloudLabels = await cloudLabeler.processImage(visionImage);
      if (cloudLabels.length == 0) {
        findItem = 2;
      } else {
        List<String> values = new List();
        for (ImageLabel label in cloudLabels) {
          final String text = label.text;
          values.add(text);
          print(text);
        }
        print(values);
        return values;
      }
    } catch (e) {
      print(e.toString());
    } finally {
      cloudLabeler.close();
    }
  }

  // Detect Barcode
  detectBarCodes(
      FirebaseVisionImage visionImage, BarcodeDetector barcodeDetector) async {
    try {
      final List<Barcode> barCodes =
          await barcodeDetector.detectInImage(visionImage);
      if (barCodes.length == 0) {
        findItem = 1;
      } else {
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
        final FirebaseVisionImage visionImage =
            FirebaseVisionImage.fromFile(imageFile);
        final BarcodeDetector barcodeDetector =
            FirebaseVision.instance.barcodeDetector();
        final ImageLabeler cloudLabeler = FirebaseVision.instance
            .cloudImageLabeler(
                CloudImageLabelerOptions(confidenceThreshold: 0.85));

        String foundValue =
            (await detectBarCodes(visionImage, barcodeDetector));

        // Barcode not found, try image labeling
        if (findItem == 1) {
          var values = await detectImageLabels(visionImage, cloudLabeler);
          if (findItem == 2) {
            setState(() {
              result = "Nothing found!";
            });
          } else {
            Navigator.of(context)
                .pushNamed(ItemListScreen.routeName, arguments: {
              'itemList': ScanScreen.itemList,
              'categoryList': values,
            });

            setState(() {
              result = "Found Item.....";
            });
          }
          // Add item that was found with the barcode
        } else {
          DocumentSnapshot foundItem = await getItem(foundValue);
          List<Project> allProjects = List();
          List<Product> allProducts = List();

          // Get Projects
          foundItem['projects'].forEach((elm) async {
            DocumentSnapshot foundProject = await getProject(elm);
            allProjects.add(Project(
                name: foundProject['name'],
                url: foundProject['videoURL'],
                descritption: foundProject['description']));
          });

          // Get Products
          foundItem['products'].forEach((elm) async {
            DocumentSnapshot foundProduct = await getProduct(elm);
            allProducts.add(Product(
                name: foundProduct['name'],
                url: foundProduct['imageURL'],
                description: foundProduct['description'],
                price: foundProduct['price'],
                link: foundProduct['link']));
          });

          List<String> instructions = [];

          foundItem['recycle']['instructions'].forEach((elm) {
            instructions.add(elm);
          });

          Recycle recycleFound = Recycle(
              type: foundItem['recycle']['type'], instructions: instructions);

          Item item = Item(
              name: foundItem['name'],
              category: foundItem['category'],
              id: foundItem['name'],
              url: foundItem['imageURL'],
              listProjects: allProjects,
              listProducts: allProducts,
              recycleInfo: recycleFound);
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
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            padding: EdgeInsets.all(30),
            child: Image.asset('assets/logo-01.png', fit: BoxFit.scaleDown),
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
