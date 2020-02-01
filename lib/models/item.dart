import 'package:recycling_app/models/recycle.dart';

import 'package:flutter/foundation.dart';
import 'dart:developer';

import 'products.dart';
import 'project.dart';

enum Size {
  small, medium, large
}

class Item{

  final int id;
  final String name;
  final String imgUrl;
  final String brand;
  final Size size;
  final String material;
  final String category;
  final List <Product> product;
  final Recycle recycling;
  final List <Project> project;

  Item( {@required this.category, @required this.name, @required this.id, @required this.imgUrl, this.brand, @required this.size,@required this.material, this.product, this.recycling, this.project,});

  sendToDatabase(){
    log (' id: $id\n name: $name');
  }

}