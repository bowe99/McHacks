import 'package:flutter/foundation.dart';

import './project.dart';
import './products.dart';
import './recycle.dart';

class Item {
  final String id;
  final String name;
  final String category;
  final String url;
  final String brand;
  final String packageSize;
  final String material;

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
