import 'package:equatable/equatable.dart';

class Item extends Equatable {
  Item({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.price,
  });

  final String id, title, thumbnail;
  final num price;

  @override
  List<Object?> get props => [
        id,
        title,
        thumbnail,
        price,
      ];
}
