import 'dart:core'; 
import 'package:tree_view/treeView.dart';
import 'package:resources_loader/resources_loader.dart';
import 'package:js/js_util.dart';



main() {

  ResourcesLoaderService _resourcesLoader = new ResourcesLoaderService();
  TreeView.loadResources(_resourcesLoader, onData:()
  {
    showTree1();
    showTree2();

  });

}

void showTree1(){

  var subitemsList = new List<Item>()
  ..add(new Item("subitem 1"));

  var item = new Item("item 1", items: subitemsList);

  var list = new List<dynamic>();
  list.add(item.getJsObject());

  var dataSourceOptions = new HierarchicalDataSourceOptions()
    ..data = list;

  var dataSource = new HierarchicalDataSource(dataSourceOptions);

  TreeViewOptions options = new TreeViewOptions()
    ..dragAndDrop = true
    ..dataSource = dataSource;

  new TreeView("#tree1", options);
}

void showTree2(){

  var subitemsList = new List<Item>()
    ..add(new Item("subitem 2"));

  var item = new Item("item 2", items: subitemsList);

  var list = new List<dynamic>();
  list.add(item.getJsObject());

  var dataSourceOptions = new HierarchicalDataSourceOptions()
    ..data = list;

  var dataSource = new HierarchicalDataSource(dataSourceOptions);

  TreeViewOptions options = new TreeViewOptions()
    ..dragAndDrop = true
    ..dataSource = dataSource;

  new TreeView("#tree2", options);
}
