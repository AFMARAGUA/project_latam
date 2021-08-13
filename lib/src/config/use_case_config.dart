import 'package:project_latam/src/data/driven_adapter/item_api/item_api.dart';
import 'package:project_latam/src/domain/use_cases/item/get_item_use_case.dart';

class UseCaseConfig {
  late GetItemUseCase getItemUseCase;
  late ItemApi _itemApi;
  UseCaseConfig() {
    _itemApi = ItemApi();
    getItemUseCase = GetItemUseCase(_itemApi);
  }
}
