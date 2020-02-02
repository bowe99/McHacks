import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

String name;
String category;
String brand;
String imgURL;
String packageSize;
String material;
List<String> _categories = ['Cans', 'Containers', 'Wrapping (fruit / veggie)', 'Wrapping (Meats / Fish)'];
List<String> _sizes = ['Small (< 30 cm)', 'Medium (< 0.5 m)', 'Large (> 0.5 m)'];

class _AddItemState extends State<AddItem> {
  @override
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView 
      (child: Container(
        padding: EdgeInsets.all(50), 
        alignment: Alignment.topRight,
        child:Column(
        children: <Widget>[
         
         TextFormField(
           decoration: const InputDecoration(
            hintText: 'What is this product called? *',
            labelText: 'Name of Product *',
          ), // The validator receives the text that the user has entered.
          validator: (value) {
              if (value.isEmpty) {
              return 'Please enter some text';
              }
              else name = value;
          return null;
            },
        ),
        TextFormField(
           decoration: const InputDecoration(
            hintText: 'What is the brand of this product?',
            labelText: 'Brand',
          ), // The validator receives the text that the user has entered.
        ),
        TextFormField(
           decoration: const InputDecoration(
            hintText: 'What is the material this product is made of *?',
            labelText: 'Material *',
          ), // The validator receives the text that the user has entered.
          validator: (value) {
              if (value.isEmpty) {
              return 'Please enter some text';
              }
              else material = value;
          return null;
            },
        ),
         TextFormField(
           decoration: const InputDecoration(
            hintText: 'Please enter an image url.',
            labelText: 'Image URL *',
          ), // The validator receives the text that the user has entered.
          validator: (value) {
              if (value.isEmpty) {
              return 'Please enter some text';
              }
              else imgURL = value;
          return null;
            },
        ),
        DropdownButton(
            hint: Text('Please choose a category'), // Not necessary for Option 1
            value: category,
            onChanged: (newValue) {
              setState(() {
                category = newValue;
              });
            },
            items: _categories.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),
          Container(
            child: DropdownButton(
                    hint: Text('Please choose a Package Size'), // Not necessary for Option 1
                    value: packageSize,
                    onChanged: (newValue) {
                    setState(() {
                    packageSize = newValue;
               });
             },
             items: _sizes.map((location) {
               return DropdownMenuItem(
                 child: new Text(location),
                 value: location,
               );
             }).toList(),
           )
           ),
        RaisedButton(
              onPressed: () {
              // Validate returns true if the form is valid, otherwise false.
              if (_formKey.currentState.validate()) {
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.

                  Scaffold
                  .of(context)
                  .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
            },
            child: Text('Submit'),
        )
              // Add TextFormFields and RaisedButton here.
        ]
     )
      )
      )
    );
  }
}

