import 'package:flutter/material.dart';
import 'package:project_latam/src/config/use_case_config.dart';
import 'package:project_latam/src/domain/models/item/item.dart';

class ItemProvider with ChangeNotifier {
  UseCaseConfig _useCaseConfig = UseCaseConfig();
  List<Item> _itemList = [];

  List<Item> get itemList => _itemList;

  Future<List<Item>> viewItems() async {
    List<Item> items = await _useCaseConfig.getItemUseCase.getAll();
    this._itemList = [...items];
    return this.itemList;
  }
}
