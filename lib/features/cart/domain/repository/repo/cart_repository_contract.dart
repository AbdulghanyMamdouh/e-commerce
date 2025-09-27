import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/cart/domain/entity/cart_response_entity.dart';

abstract class CartRepositoryContract {
  Future<Either<Failures, CartResponseEntity>> getCart();

  Future<Either<Failures, CartResponseEntity>> updateCart(
      {required String productId, required int count});
  Future<Either<Failures, String>> removeFromCart(String productId);
  Future<Either<Failures, String>> addToCart(String productId);
}
