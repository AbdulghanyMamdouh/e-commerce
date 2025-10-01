import 'package:shopping_app/features/cart/domain/entity/cart_response_entity.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class AddToCartLoadingState extends CartStates {}

class AddToCartSuccessState extends CartStates {
  final String message;

  AddToCartSuccessState({required this.message});
}

class AddToCartErrorState extends CartStates {
  final String errMsg;

  AddToCartErrorState({required this.errMsg});
}

class RemoveFromCartLoadingState extends CartStates {}

class RemoveFromCartSuccessState extends CartStates {
  final String message;

  RemoveFromCartSuccessState({required this.message});
}

class RemoveFromCartErrorState extends CartStates {
  final String errMsg;

  RemoveFromCartErrorState({required this.errMsg});
}

class UpdateCartLoadingState extends CartStates {}

class UpdateCartSuccessState extends CartStates {
  final String message;
  UpdateCartSuccessState({required this.message});
}

class UpdateCartErrorState extends CartStates {
  final String errMsg;
  UpdateCartErrorState({required this.errMsg});
}

class GetCartLoadingState extends CartStates {}

class GetCartSuccessState extends CartStates {
  final CartResponseEntity? cartData;

  GetCartSuccessState({required this.cartData});
}

class GetCartErrorState extends CartStates {
  final String error;

  GetCartErrorState(this.error);
}
