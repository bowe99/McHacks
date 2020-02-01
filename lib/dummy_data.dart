import 'package:recycling_app/models/item.dart';

import 'models/recycle.dart';

const List<Item> DUMMY_ITEMS = const[
  Item(
    name: 'Test',
    category: 'CatTest',
    id: '06541432',
    url: 'https://upload.wikimedia.org/wikipedia/commons/8/87/Donboscocambodia0001.JPG',
    brand: 'BrandTest',
    listProducts: [],
    listProjects: [],
    material: 'materialTest',
    packageSize: 'pkgSize',
    recycleInfo: Recycle(
      type: 'typeTest',
      instructions: ['instructionTest'],
    )
  ),
];
