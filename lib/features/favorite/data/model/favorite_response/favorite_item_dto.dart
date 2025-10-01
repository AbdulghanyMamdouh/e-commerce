import 'package:shopping_app/features/favorite/domain/entity/favorite_item_entity.dart';

class FavoriteItemDTO extends FavoriteItemEntity {
  List<String>? images;

  int? ratingsQuantity;

  String? description;
  int? quantity;

  double? ratingsAverage;

  FavoriteItemDTO({
    this.images,
    this.ratingsQuantity,
    required super.id,
    required super.title,
    this.description,
    this.quantity,
    required super.price,
    required super.imageCover,
    this.ratingsAverage,
  });

  factory FavoriteItemDTO.fromJson(Map<String, dynamic> json) =>
      FavoriteItemDTO(
        images: json['images'] as List<String>?,
        ratingsQuantity: json['ratingsQuantity'] as int?,
        id: json['_id'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        quantity: json['quantity'] as int,
        price: json['price'] as int,
        imageCover: json['imageCover'] as String,
        ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
      );
}
