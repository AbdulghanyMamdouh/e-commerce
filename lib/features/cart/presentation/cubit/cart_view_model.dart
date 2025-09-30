import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/cart/domain/entity/cart_response_entity.dart';
import 'package:shopping_app/features/cart/domain/use_case/cart_use_case.dart';
import 'package:shopping_app/features/cart/presentation/cubit/cart_states.dart';

class CartViewModel extends Cubit<CartStates> {
  CartViewModel({
    required this.cartUseCase,
  }) : super(CartInitialState());

  CartResponseEntity? cartData;
  final CartUseCase cartUseCase;

  Future<void> addToCart({required String productId}) async {
    emit(AddToCartLoadingState());
    final either = await cartUseCase.addToCart(productId);
    either.fold((failure) {
      emit(AddToCartErrorState(
          errMsg:
              failure.errorMessage ?? 'Failed to add your product to cart'));
    }, (responseMessage) {
      emit(AddToCartSuccessState(message: responseMessage));
    });
  }

  Future<void> removeFromCart({required String productId}) async {
    emit(RemoveFromCartLoadingState());
    final either = await cartUseCase.removeFromCart(productId);
    either.fold((failure) {
      emit(
        RemoveFromCartErrorState(
            errMsg: failure.errorMessage ??
                'Failed to remove your product from cart'),
      );
    }, (newCart) {
      cartData = newCart;
      // emit(GetCartSuccessState(cartData: cartData!));
      emit(
        RemoveFromCartSuccessState(
          message: 'Product removed from cart successfully',
        ),
      );
    });
  }

  Future<void> updateCart(
      {required String productId, required int count}) async {
    emit(UpdateCartLoadingState());
    final either =
        await cartUseCase.updateCart(productId: productId, count: count);
    either.fold((failure) {
      emit(
        UpdateCartErrorState(
            errMsg: failure.errorMessage ?? 'Failed to update your cart'),
      );
    }, (newCart) {
      cartData = newCart;
      emit(
        UpdateCartSuccessState(message: 'Cart updated successfully'),
      );
    });
  }

  Future<void> getUserCart() async {
    emit(GetCartLoadingState());
    final either = await cartUseCase.getUserCart();
    either.fold((failure) {
      emit(GetCartErrorState(
          failure.errorMessage ?? 'Failed to load your cart'));
    }, (cartResponse) {
      cartData = cartResponse;
      emit(GetCartSuccessState(cartData: cartResponse));
    });
  }
}
