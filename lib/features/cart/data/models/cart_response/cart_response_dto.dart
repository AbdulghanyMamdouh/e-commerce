import 'package:shopping_app/features/cart/data/models/cart_response/cart_item_dto.dart';
import 'package:shopping_app/features/cart/domain/entity/cart_response_entity.dart';

class CartResponseDTO extends CartResponseEntity {
  String? statusMsg;
  String? message;
  CartResponseDTO(
      {this.message,
      this.statusMsg,
      super.status,
      super.numOfCartItems,
      super.cartId,
      super.data});

  factory CartResponseDTO.fromMap(Map<String, dynamic> data) => CartResponseDTO(
        statusMsg: data['statusMsg'] as String?,
        message: data['message'] as String?,
        status: data['status'] as String?,
        numOfCartItems: data['numOfCartItems'] as int?,
        cartId: data['cartId'] as String?,
        data: data['data'] == null
            ? null
            : CartItemDTO.fromMap(data['data'] as Map<String, dynamic>),
      );
}
