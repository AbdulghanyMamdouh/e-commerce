import 'package:shopping_app/features/cart/domain/entity/product_cart_entity.dart';

class CartItemEntity {
  String id;

  List<ProductCartEntity> product;

  int totalCartPrice;

  CartItemEntity({
    required this.id,
    required this.product,
    required this.totalCartPrice,
  });
}
