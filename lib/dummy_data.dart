import 'package:recycling_app/models/item.dart';

import './models/project.dart';
import './models/recycle.dart';

const List<Item> DUMMY_ITEMS = const [
  Item(
      name: 'Test',
      category: 'CatTest',
      id: '06541432',
      url:
          'https://upload.wikimedia.org/wikipedia/commons/8/87/Donboscocambodia0001.JPG',
      brand: 'BrandTest',
      listProducts: [],
      listProjects: DUMMY_PROJECTS,
      material: 'materialTest',
      packageSize: 'pkgSize',
      recycleInfo: Recycle(
        type: 'typeTest',
        instructions: ['instructionTest'],
      )),
];

const List<Project> DUMMY_PROJECTS = const [
  Project(
    name: 'Project Name',
    descritption: 'Project Description',
    url: 'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
        
    // steps: [
    //   {
    //     'url': 'image-step-1',
    //     'step': 'Fold engine in half',
    //   },
    //   {
    //     'url': 'image-step-2',
    //     'step': 'Fuel Rocket',
    //   },
    //   {
    //     'url': 'image-step-1',
    //     'step': 'Go to space',
    //   },
    // ],
  ),
  Project(
    name: ''
  )
];
