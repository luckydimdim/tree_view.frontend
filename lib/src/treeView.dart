@JS()
library kendoTreeView;

import 'package:js/js.dart';
import 'package:resources_loader/resources_loader.dart';
import 'package:js/js_util.dart';

@anonymous
@JS()
class HierarchicalDataSourceOptions{

  external dynamic get data;
  external set data(dynamic v);

  external factory HierarchicalDataSourceOptions();
}

@JS('kendo.data.HierarchicalDataSource')
class HierarchicalDataSource{


  external HierarchicalDataSourceOptions get options;
  external set options(HierarchicalDataSourceOptions v);


  external HierarchicalDataSource(HierarchicalDataSourceOptions options);
}

@anonymous
@JS()
class TreeViewOptions {
  external String get name;
  external set name(String v);

  external bool get dragAndDrop;
  external set dragAndDrop(bool v);

  external HierarchicalDataSource get dataSource;
  external set dataSource(HierarchicalDataSource v);


  external factory TreeViewOptions(
      {String name, bool dragAndDrop, HierarchicalDataSource dataSource});
}

@JS('kendo.ui.TreeView')
class _KendoTreeView {
  external _KendoTreeView(String query, TreeViewOptions options);
}

class Item {

  String text;
  List<Item> items;

  Item(this.text, {List<Item> this.items}){

    if (this.items == null)
      this.items = new  List<Item>();

  }

  dynamic getJsObject(){
    var obj = newObject();
    List<dynamic> jsList = new  List<dynamic>();
    setProperty(obj, "text", text);

    items.forEach((i){
      var jsItem = i.getJsObject();
      jsList.add(jsItem);
    });


    setProperty(obj, "items", jsList);

    return obj;
  }
}

class TreeView {

  static void loadResources( ResourcesLoaderService _resourcesLoader, {onData(), onError(error), onDone()}){
    bool minification = false;

    if (_resourcesLoader != null) {
      _resourcesLoader.loadStyle(
          'packages/tree_view/src/', 'kendo.common-bootstrap.min.css');
      _resourcesLoader.loadStyle(
          'packages/tree_view/src/', 'kendo.bootstrap.min.css');

      _resourcesLoader.loadScript(
          'packages/tree_view/src/',
          'kendo.core' + (minification ? '.min' : '') + '.js', false);
      _resourcesLoader.loadScript(
          'packages/tree_view/src/',
          'kendo.data' + (minification ? '.min' : '') + '.js', false);
      _resourcesLoader.loadScript(
          'packages/tree_view/src/',
          'kendo.userevents' + (minification ? '.min' : '') + '.js', false);
      _resourcesLoader.loadScript(
          'packages/tree_view/src/',
          'kendo.draganddrop' + (minification ? '.min' : '') + '.js', false);
      _resourcesLoader.loadScript(
          'packages/tree_view/src/',
          'kendo.treeview.draganddrop' + (minification ? '.min' : '') + '.js',
          false);

      _resourcesLoader.loadScript(
          'packages/tree_view/src/',
          'kendo.treeview' + (minification ? '.min' : '') + '.js', false,
          onData: onData);
    }

  }

  TreeView(String query, TreeViewOptions options) {

    new _KendoTreeView(query, options);
  }


}
