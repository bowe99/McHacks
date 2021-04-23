import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recycling_app/screens/item_result_screen.dart';

class AddItem extends StatefulWidget {
  static const routeName = '/add';

  @override
  _AddItemState createState() => _AddItemState();
}

String name;
String category;
String barcode;
bool success;

class _AddItemState extends State<AddItem> {
  Future<String> getImageFile() async {
    ImagePicker _imagePicker = new ImagePicker();
    PickedFile image = await _imagePicker.getImage(source: ImageSource.camera);
    return image.path;
  }

    // Detect Barcode
  detectBarCodes(
      FirebaseVisionImage visionImage, BarcodeDetector barcodeDetector) async {
    try {
      final List<Barcode> barCodes =
          await barcodeDetector.detectInImage(visionImage);
      if (barCodes.length == 0) {
        success = true;
      } else {
        return (barCodes[0].rawValue);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      barcodeDetector.close();
    }
  }
  
  Future<String> getBarcode() async {
    String filePath = await getImageFile();
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(File(filePath));
    final BarcodeDetector barcodeDetector =
        FirebaseVision.instance.barcodeDetector();
    
    return (await detectBarCodes(visionImage, barcodeDetector));

  }

  Future<void> createItem() async {
    FirebaseFirestore _firebase = FirebaseFirestore.instance;

    barcode = await getBarcode();

    CollectionReference items = _firebase.collection('barcode');
    items.add({
      'barcode': barcode,
      'category': [category],
      'name': name
    }).then((value) {
      print("Item Added");
    }).catchError((error) => print("Failed to add item: $error"));
  }

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final categoryController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item', style: Theme.of(context).textTheme.bodyText2),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.lightGreen[900], Colors.lime[200]])),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(50),
          alignment: Alignment.topRight,
          child: Column(
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  hintText: 'What is this product called? *',
                  labelText: 'Name of Product *',
                ),
                controller:
                    nameController, // The validator receives the text that the user has entered.
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'What is this product called? *',
                  labelText: 'Name of Category *',
                ),
                controller:
                    categoryController, // The validator receives the text that the user has entered.
              ),
              ElevatedButton(
                onPressed: () async{
                  setState(() {
                    name = nameController.text;
                    category = categoryController.text;
                  });
                  
                  await createItem();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
