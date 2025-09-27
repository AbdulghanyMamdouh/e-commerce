import 'package:shopping_app/features/cart/data/models/cart_response/product_cart_dto.dart';

class CartItemEntity {
  String id;

  List<ProductCartDTO> products;

  int totalCartPrice;

  CartItemEntity({
    required this.id,
    required this.products,
    required this.totalCartPrice,
  });
}
