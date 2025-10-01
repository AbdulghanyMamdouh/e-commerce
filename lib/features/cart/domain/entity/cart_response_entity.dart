import 'package:shopping_app/features/cart/data/models/cart_response/cart_item_dto.dart';

class CartResponseEntity {
  String? status;
  int? numOfCartItems;
  String? cartId;
  CartItemDTO? data;

  CartResponseEntity(
      {this.status, this.numOfCartItems, this.cartId, this.data});
}
