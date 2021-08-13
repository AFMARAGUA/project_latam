import 'package:project_latam/src/data/helpers/maps/common/base_mapper.dart';
import 'package:project_latam/src/domain/models/item/item.dart';

class ItemMapper implements BaseMapper<Item> {
  @override
  fromMap(Map<String, dynamic> json) => Item(
        id: json["id"],
        price: json["price"],
        thumbnail: json["thumbnail"],
        title: json["title"],
      );
}
