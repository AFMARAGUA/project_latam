import 'package:project_latam/src/domain/models/gateway/item_gateway.dart';
import 'package:project_latam/src/domain/models/item/item.dart';

class GetItemUseCase {
  final ItemGateway _itemGateway;
  GetItemUseCase(this._itemGateway);
  Future<List<Item>> getAll() {
    return this._itemGateway.getAll();
  }

  Future<List<Item>> getAllSearch(String search) {
    return this._itemGateway.getAllSearch(search);
  }
}
