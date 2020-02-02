import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

String name;
String category;
String brand;
String packageSize;
String material;
String imgURL;
//List<String> _categories = ['Cans', 'Containers', 'Wrapping (fruit / veggie)', 'Wrapping (Meats / Fish)'];
List<String> _sizes = ['Small (< 30 cm)', 'Medium (< 0.5 m)', 'Large (> 0.5 m)'];

class _SearchScreenState extends State<SearchScreen> {
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
           style: TextStyle(fontFamily: 'Montserrat-Regular', color: Colors.lightGreen[900]),
           decoration: const InputDecoration(
            hintText: 'What is this product called? *',
            labelText: 'Name of Product *',
          ), // The validator receives the text that the user has entered.
           validator: (value) {
              imgURL = value;
          return null;
            },
        ),
        TextFormField(
          style: TextStyle(fontFamily: 'Montserrat-Regular', color: Colors.lightGreen[900]),
           decoration: const InputDecoration(
            hintText: 'What is the brand of this product?',
            labelText: 'Brand',
          ), // The validator receives the text that the user has entered.
          validator: (value) {
              brand = value;
          return null;
            },
        ),
        TextFormField(
          style: TextStyle(fontFamily: 'Montserrat-Regular', color: Colors.lightGreen[900]),
           decoration: const InputDecoration(
            hintText: 'What is the material this product is made of *?',
            labelText: 'Material *',
          ), // The validator receives the text that the user has entered.
         validator: (value) {
              material = value;
          return null;
            },
        ),

        TextFormField(
          style: TextStyle(fontFamily: 'Montserrat-Regular', color: Colors.lightGreen[900]),
           decoration: const InputDecoration(
            hintText: 'What is the category of this product*?',
            labelText: 'Category *',
          ), // The validator receives the text that the user has entered.
         validator: (value) {
              category = value;
          return null;
            },
        ),
          Container(
            padding: EdgeInsets.all(10), 
            child: DropdownButton(
              style: TextStyle(fontFamily: 'Montserrat-Regular', color: Colors.lightGreen[900]),
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
           ),
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
            child: Text('Search',  style: Theme.of(context).textTheme.body1),
        )
              // Add TextFormFields and RaisedButton here.
        ]
     )
      )
      )
    );
  }
}

