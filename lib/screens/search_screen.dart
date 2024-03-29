import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recycling_app/models/db_item.dart';
import 'package:recycling_app/screens/db_screen/db_item_list_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

String name = '';
String category = '';

class _SearchScreenState extends State<SearchScreen> {
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final itemsList = [];

  Future searchDatabase() {
    FirebaseFirestore _firebase = FirebaseFirestore.instance;
    if (name == '') {
      if (category == '') {
        _firebase
            .collection("barcode")
            .get()
            .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            print(doc['barcode']);
            setState(() {
              itemsList.add(new DBItem(
                  barcode: doc['barcode'],
                  categories: doc['category'],
                  name: doc['name']));
            });
          });
        });
      } else {
        _firebase
            .collection("barcode")
            .where("category", arrayContains: category)
            .get()
            .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            print(doc['barcode']);
            setState(() {
              itemsList.add(new DBItem(
                  barcode: doc['barcode'],
                  categories: doc['category'],
                  name: doc['name']));
            });
          });
        });
      }
    } else {
      if (category == '') {
        _firebase
            .collection("barcode")
            .where('name', isEqualTo: name)
            .get()
            .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            print(doc['barcode']);
            setState(() {
              itemsList.add(new DBItem(
                  barcode: doc['barcode'],
                  categories: doc['category'],
                  name: doc['name']));
            });
          });
        });
      } else {
        _firebase
            .collection("barcode")
            .where('name', isEqualTo: name)
            .where("category", arrayContains: category)
            .get()
            .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            print(doc['barcode']);

            setState(() {
              itemsList.add(new DBItem(
                  barcode: doc['barcode'],
                  categories: doc['category'],
                  name: doc['name']));
            });
          });
        });
      }
    }

    Navigator.of(context).pushNamed(DBItemListScreen.routeName, arguments: {
      'itemList': itemsList,
    });

    itemsList.retainWhere((element) => element.barcode == -1);
  }

  Future<void> _showSearchInfo() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Search Info',
            style: TextStyle(
              color: Colors.lightGreen[800],
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                      'Here you can search for the items that you have' +
                          ' stored before.',
                      style: TextStyle(color: Colors.lime[800])),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Got it!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(50),
                alignment: Alignment.topRight,
                child: Column(children: <Widget>[
                  TextFormField(
                    style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        color: Colors.lightGreen[900]),
                    decoration: const InputDecoration(
                      hintText: 'What is this product called?',
                      labelText: 'Name of Product',
                    ), // The validator receives the text that the user has entered.
                    controller: nameController,
                  ),
                  TextFormField(
                    style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        color: Colors.lightGreen[900]),
                    decoration: const InputDecoration(
                      hintText: 'What is the category of this product?',
                      labelText: 'Category',
                    ), // The validator receives the text that the user has entered.
                    controller: categoryController,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 50),
                          child: FloatingActionButton.extended(
                            backgroundColor: Colors.lightGreen[800],
                            onPressed: () async {
                              setState(() {
                                name = nameController.text;
                                category = categoryController.text;
                              });
                              await searchDatabase();
                            },
                            label: Text('Search',
                                style: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    color: Colors.white,
                                    fontSize: 18)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 50),
                          child: IconButton(
                            onPressed: () {
                              _showSearchInfo();
                            },
                            icon:
                                Icon(Icons.info, color: Colors.lightGreen[800]),
                            iconSize: 55,
                          ),
                        ),
                      ])
                  // Add TextFormFields and RaisedButton here.
                ]))));
  }
}
