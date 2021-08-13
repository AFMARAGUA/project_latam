import 'package:flutter/material.dart';
import 'package:project_latam/src/config/use_case_config.dart';
import 'package:project_latam/src/domain/models/item/item.dart';

class ItemSearchProvider with ChangeNotifier {
  UseCaseConfig _useCaseConfig = UseCaseConfig();
  List<Item> _itemList = [];
  String _search = '';

  List<Item> get itemList => _itemList;
  String get search => _search;

  Future<List<Item>> viewItems() async {
    List<Item> items = await _useCaseConfig.getItemUseCase.getAllSearch(search);
    this._itemList = [...items];
    return this.itemList;
  }

  void getItems(String search) {
    this._search = search;
    notifyListeners();
  }
}
