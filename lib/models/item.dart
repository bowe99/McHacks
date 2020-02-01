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


  final List<Product> listProducts;
  final List<Project> listProjects;
  final Recycle recycleInfo;

  const Item({
    this.brand,
    this.material,
    @required this.name,
    this.packageSize,
    @required this.category,
    @required this.id,
    @required this.url,

    this.listProducts,
    this.listProjects,
    this.recycleInfo,
  });
}

