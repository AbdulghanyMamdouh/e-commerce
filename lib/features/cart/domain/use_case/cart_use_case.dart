import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/cart/domain/entity/cart_response_entity.dart';
import 'package:shopping_app/features/cart/domain/repository/repo/cart_repository_contract.dart';

class CartUseCase {
  CartRepositoryContract cartRepository;
  CartUseCase({required this.cartRepository});

  Future<Either<Failures, CartResponseEntity>> getUserCart() async {
    return await cartRepository.getCart();
  }

  Future<Either<Failures, CartResponseEntity>> updateCart(
      {required String productId, required int count}) async {
    return await cartRepository.updateCart(productId: productId, count: count);
  }

  Future<Either<Failures, String>> removeFromCart(String productId) async {
    return await cartRepository.removeFromCart(productId);
  }

  Future<Either<Failures, String>> addToCart(String productId) async {
    return await cartRepository.addToCart(productId);
  }
}
