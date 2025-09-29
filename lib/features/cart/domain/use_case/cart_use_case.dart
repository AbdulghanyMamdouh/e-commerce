import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/cart/domain/entity/cart_response_entity.dart';
import 'package:shopping_app/features/cart/domain/repository/repo/cart_repository_contract.dart';

class CartUseCase {
  CartRepositoryContract cartRepositoryContract;
  CartUseCase({required this.cartRepositoryContract});

  Future<Either<Failures, CartResponseEntity>> getUserCart() async {
    return await cartRepositoryContract.getCart();
  }

  Future<Either<Failures, CartResponseEntity>> updateCart(
      {required String productId, required int count}) async {
    return await cartRepositoryContract.updateCart(
        productId: productId, count: count);
  }

  Future<Either<Failures, CartResponseEntity>> removeFromCart(
      String productId) async {
    return await cartRepositoryContract.removeFromCart(productId);
  }

  Future<Either<Failures, String>> addToCart(String productId) async {
    return await cartRepositoryContract.addToCart(productId);
  }
}
