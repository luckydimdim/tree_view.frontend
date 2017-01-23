import 'dart:core';
import 'package:tree_view/treeView.dart';
import 'package:resources_loader/resources_loader.dart';
import 'package:js/js_util.dart';

main() {
  ResourcesLoaderService _resourcesLoader = new ResourcesLoaderService();


  var obj = newObject();

  setProperty(obj, "text", "test");

  var list = new List<dynamic>();
  list.add(obj);

  var dataSourceOptions = new HierarchicalDataSourceOptions()
    ..data = list;

  var dataSource = new HierarchicalDataSource(dataSourceOptions);

  TreeViewOptions options = new TreeViewOptions()
    ..dragAndDrop = true
    ..dataSource = dataSource;

  new TreeView(_resourcesLoader, "#tree1", options);
  //new TreeView(resourcesLoader, "#tree2", options);
}
