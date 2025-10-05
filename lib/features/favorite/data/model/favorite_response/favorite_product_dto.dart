import 'package:shopping_app/features/favorite/data/model/favorite_response/favorite_item_dto.dart';
import 'package:shopping_app/features/favorite/domain/entity/favorite_product_Entity.dart';

class FavoriteProductDTO extends FavoriteProductEntity {
  FavoriteProductDTO({
    required super.favoriteProducts,
  });
  factory FavoriteProductDTO.fromJson(Map<String, dynamic> json) {
    return FavoriteProductDTO(
      favoriteProducts: (json['data'] as List<dynamic>)
          .map((e) => FavoriteItemDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
