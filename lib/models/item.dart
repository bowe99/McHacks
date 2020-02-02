import 'package:recycling_app/models/recycle.dart';

import 'package:flutter/foundation.dart';

import './products.dart';
import './project.dart';

// enum Size

class Item{

  final String id;
  final String name;
  final String url;
  final String brand;
  final String packageSize;
  final String material;
  final String category;

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

