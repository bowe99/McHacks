import 'package:recycling_app/models/products.dart';
import 'package:recycling_app/models/project.dart';
import 'package:recycling_app/models/recycle.dart';

class DBItem {
  final String barcode;
  final String name;
  final List<dynamic> categories;
  final Recycle recycleInfo = new Recycle(instructions: ['Wash container', 'Dry container', 'Toss Container in recycle bin'], type: 'Metal #2', mapURL: '');
  final List<Product> listProducts = [];
  final List<Project> listProjects = [];

  DBItem({this.barcode, this.categories, this.name});
}