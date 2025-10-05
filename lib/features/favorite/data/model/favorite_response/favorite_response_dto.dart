import 'package:shopping_app/features/favorite/domain/entity/favorite_product_entity.dart';

import 'favorite_item_dto.dart';

class FavoriteResponseDTO extends FavoriteProductEntity {
  String? status;
  String? statusMsg;
  String? message;
  int? count;

  FavoriteResponseDTO(
      {this.status,
      this.count,
      super.favoriteProducts,
      this.statusMsg,
      this.message});

  factory FavoriteResponseDTO.fromJson(Map<String, dynamic> json) {
    return FavoriteResponseDTO(
      statusMsg: json['statusMsg'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
      count: json['count'] as int?,
      favoriteProducts: (json['data'] as List<dynamic>?)
          ?.map((e) => FavoriteItemDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
