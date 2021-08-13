import 'dart:convert';

import 'package:project_latam/src/data/helpers/maps/item/item_mapper.dart';
import 'package:project_latam/src/domain/models/gateway/item_gateway.dart';
import 'package:project_latam/src/domain/models/item/item.dart';
import 'package:http/http.dart' as http;

class ItemApi extends ItemGateway {
  final String url = "https://api.mercadolibre.com/sites/MCO/search";
  ItemMapper _itemMapper = ItemMapper();

  @override
  Future<List<Item>> getAll() async {
    final response = await http.get(Uri.parse('$url?category=MCO1430'));
    if (response.statusCode == 200) {
      var jsonDecode = json.decode(utf8.decode(response.bodyBytes));
      List<Item> items = (jsonDecode["results"] as List)
          .map((res) => _itemMapper.fromMap(res) as Item)
          .toList();
      return Future<List<Item>>.value(items);
    } else {
      throw Exception('Http error');
    }
  }

  @override
  Future<List<Item>> getAllSearch(String search) async {
    final response =
        await http.get(Uri.parse('$url?q=$search&category=MCO1430'));
    if (response.statusCode == 200) {
      var jsonDecode = json.decode(utf8.decode(response.bodyBytes));
      List<Item> items = (jsonDecode["results"] as List)
          .map((res) => _itemMapper.fromMap(res) as Item)
          .toList();
      return Future<List<Item>>.value(items);
    } else {
      throw Exception('Http error');
    }
  }
}
