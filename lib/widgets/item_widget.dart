import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String barCode;
  final String name;
  final String category;
  final String url;
  final String brand;
  final String packageSize;
  final String material;

  ItemWidget({
    @required this.barCode,
    @required this.brand,
    @required this.material,
    @required this.name,
    @required this.packageSize,
    @required this.url,
    @required this.category,
  });

  // Widget buildInkWell(Color bgColor, String title, BuildContext context) {
  //   return InkWell(
  //     //onTap: () => selectCategory(context),
  //     onTap: () {},
  //     splashColor: Theme.of(context).primaryColor,
  //     borderRadius: BorderRadius.circular(15),
  //     child: Container(
  //       height: 100,
  //       width: 100,
  //       padding: const EdgeInsets.all(15),
  //       child: Center(
  //         child: Text(
  //           title,
  //           style: TextStyle(
  //             fontSize: 20,
  //             color: Colors.black,
  //           ),
  //         ),
  //       ),
  //       decoration: BoxDecoration(
  //         gradient: LinearGradient(
  //           colors: [
  //             bgColor.withOpacity(0.7),
  //             bgColor,
  //           ],
  //           begin: Alignment.topLeft,
  //           end: Alignment.bottomRight,
  //         ),
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(url),
            
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                name,
                textAlign: TextAlign.left,
                style: TextStyle( color: Colors.lightGreen[900], fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 45,
                ),
                height: 250,
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Category: $category',
                      style: TextStyle( color: Colors.lightGreen[900]),
                    ),
                    Text(
                      'Brand: $brand',
                      style: Theme.of(context).textTheme.body1,
                    ),
                    Text(
                      'UPC: $barCode',
                      style: Theme.of(context).textTheme.body1,
                    ),
                    Text(
                      'Package Size: $packageSize',
                      style: Theme.of(context).textTheme.body1,
                    ),
                    Text(
                      'Material: $material',
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ],
                ),
              ),
            
            
          ],
        ),
      ],
    );
  }
}
