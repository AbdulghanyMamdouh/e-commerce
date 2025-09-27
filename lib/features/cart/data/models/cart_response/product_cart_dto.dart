import 'package:shopping_app/features/cart/domain/entity/product_cart_entity.dart';

class ProductCartDTO extends ProductCartEntity {
  ProductCartDTO({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  factory ProductCartDTO.fromMap(Map<String, dynamic> data) => ProductCartDTO(
        count: data['count'] as int?,
        id: data['_id'] as String?,
        product: data['product'] == null
            ? null
            : ProductCartDTO.fromMap(data['product'] as Map<String, dynamic>),
        price: data['price'] as int?,
      );
}
