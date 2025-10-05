import 'package:shopping_app/features/cart/domain/entity/product_cart_entity.dart';

class ProductCartDTO extends ProductCartEntity {
  ProductCartDTO({
    super.count,
    super.id,
    // super.products,
    super.price,
    required super.title,
    required super.coverImageURL,
    required super.ratingsAverage,
  });

  factory ProductCartDTO.fromMap(Map<String, dynamic> data) => ProductCartDTO(
        count: data['count'] as int?,
        id: data['product']['_id'] as String? ?? '',
        // products: data['product'] == null
        //     ? null
        //     : ProductCartDTO.fromMap(data['product'] as Map<String, dynamic>),
        price: data['price'] as int?,
        title: data['product']['title'] as String? ?? '',
        coverImageURL: data['product']['imageCover'] as String? ?? '',
        ratingsAverage: data['product']['ratingsAverage']?.toDouble() ?? 0.0,
      );
}
