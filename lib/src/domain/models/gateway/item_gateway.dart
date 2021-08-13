import '../item/item.dart';

abstract class ItemGateway {
  Future<List<Item>> getAll();
  Future<List<Item>> getAllSearch(String search);
}
