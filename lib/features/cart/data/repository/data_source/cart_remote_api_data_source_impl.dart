import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/cart/data/manager/cart_api_manager.dart';
import 'package:shopping_app/features/cart/data/models/cart_response/cart_response_dto.dart';
import 'package:shopping_app/features/cart/data/repository/data_source/cart_remote_data_source_contract.dart';
import 'package:shopping_app/features/cart/domain/entity/cart_response_entity.dart';

class CartRemoteApiDataSourceImpl extends CartRemoteDataSourceContract {
  CartApiManager cartApiManager;
  CartRemoteApiDataSourceImpl({required this.cartApiManager});

  @override
  Future<Either<Failures, CartResponseDTO>> getCart() async {
    return await cartApiManager.getCart();
  }

  @override
  Future<Either<Failures, String>> addToCart(String productId) async {
    return await cartApiManager.addToCart(productId);
  }

  @override
  Future<Either<Failures, String>> removeFromCart(String productId) async {
    return await cartApiManager.removeFromCart(productId);
  }

  @override
  Future<Either<Failures, CartResponseEntity>> updateCart(
      {required String productId, required int count}) async {
    return await cartApiManager.updateCart(count: count, productId: productId);
  }
}
