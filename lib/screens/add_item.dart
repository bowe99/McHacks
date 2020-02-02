import 'package:flutter/material.dart';
import 'package:recycling_app/screens/item_result_screen.dart';

class AddItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController;
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: <Widget>[
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'What is this product called? *',
              labelText: 'Name of Product *',
            ),
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () {
              Navigator.of(context).pushNamed(
                ItemResultScreen.routeName,
                arguments: nameController.text,
              );
            },
          ),
        ],
      ),
    );
  }
}

//   @override
//   _AddItemState createState() => _AddItemState();
// }

// class _AddItemState extends State<AddItem> {
//   String name;
//   String category;
//   String brand;
//   String imgURL;
//   String packageSize;
//   String material;
//   List<String> _sizes = [
//     'Small (< 30 cm)',
//     'Medium (< 0.5 m)',
//     'Large (> 0.5 m)'
//   ];
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController nameController;

//     SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.all(50),
//         alignment: Alignment.topRight,
//         child: Column(
//           children: <Widget>[
//             TextField(
//               decoration: const InputDecoration(
//                 hintText: 'What is this product called? *',
//                 labelText: 'Name of Product *',
//               ),
//               controller:
//                   nameController, // The validator receives the text that the user has entered.
//             ),
//             TextField(
//               decoration: const InputDecoration(
//                 hintText: 'What is the brand of this product?',
//                 labelText: 'Brand',
//               ), // The validator receives the text that the user has entered.
//             ),
//             TextField(
//               decoration: const InputDecoration(
//                 hintText: 'What is the material this product is made of *?',
//                 labelText: 'Material *',
//               ), // The validator receives the text that the user has entered.
//             ),
//             TextField(
//               decoration: const InputDecoration(
//                 hintText: 'Please enter an image url.',
//                 labelText: 'Image URL *',
//               ), // The validator receives the text that the user has entered.
//             ),
//             TextField(
//               decoration: const InputDecoration(
//                 hintText: 'Please enter a category.',
//                 labelText: 'Category *',
//               ), // The validator receives the text that the user has entered.
//             ),
//             Container(
//                 child: DropdownButton(
//               hint: Text(
//                   'Please choose a Package Size'), // Not necessary for Option 1
//               value: packageSize,
//               onChanged: (newValue) {
//                 setState(() {
//                   packageSize = newValue;
//                 });
//               },
//               items: _sizes.map((location) {
//                 return DropdownMenuItem(
//                   child: new Text(location),
//                   value: location,
//                 );
//               }).toList(),
//             )),
//             RaisedButton(
//               onPressed: () {
//                 Navigator.of(context)
//                     .pushNamed(ItemResultScreen.routeName, arguments: nameController.text);
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
