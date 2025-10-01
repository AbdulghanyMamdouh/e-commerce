import 'package:shopping_app/features/cart/data/models/cart_response/product_cart_dto.dart';
import 'package:shopping_app/features/cart/domain/entity/cart_item_entity.dart';

class CartItemDTO extends CartItemEntity {
  CartItemDTO({
    required super.id,
    required super.product,
    required super.totalCartPrice,
  });

  factory CartItemDTO.fromMap(Map<String, dynamic> data) => CartItemDTO(
        id: data['_id'] as String,
        product: (data['products'] as List<dynamic>)
            .map((e) => ProductCartDTO.fromMap(e as Map<String, dynamic>))
            .toList(),
        totalCartPrice: data['totalCartPrice'] as int,
      );
}
