import 'dart:core';
import 'dart:convert';
import 'package:tree_view/treeView.dart';
import 'package:resources_loader/resources_loader.dart';

class Obj {
  String text;

  Obj(this.text);
}

main() {
  ResourcesLoaderService resourcesLoader = new ResourcesLoaderService();

/*
  var obj = new Obj("Furniture");

  var data = new List<Obj>();
  data.add(obj);

  var dataSourceOptions = new HierarchicalDataSourceOptions()
    ..data = data;
*/

  var mapData = new Map();
  mapData['tesx'] = 'test';

  var dataSource = new HierarchicalDataSource(data: mapData);

  TreeViewOptions options = new TreeViewOptions()
  ..dragAndDrop = true
  ..dataSource = dataSource;

  new TreeView(resourcesLoader, "#tree1", options);
  //new TreeView(resourcesLoader, "#tree2", options);
}
