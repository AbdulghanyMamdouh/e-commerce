import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/cart/data/repository/data_source/cart_remote_data_source_contract.dart';
import 'package:shopping_app/features/cart/domain/entity/cart_response_entity.dart';
import 'package:shopping_app/features/cart/domain/repository/repo/cart_repository_contract.dart';

class CartRepositoryImpl extends CartRepositoryContract {
  final CartRemoteDataSourceContract remoteDataSource;
  CartRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failures, CartResponseEntity>> getCart() async {
    return await remoteDataSource.getCart();
  }

  @override
  Future<Either<Failures, String>> addToCart(String productId) async {
    return await remoteDataSource.addToCart(productId);
  }

  @override
  Future<Either<Failures, CartResponseEntity>> removeFromCart(
      String productId) async {
    return await remoteDataSource.removeFromCart(productId);
  }

  @override
  Future<Either<Failures, CartResponseEntity>> updateCart(
      {required String productId, required int count}) async {
    return await remoteDataSource.updateCart(
        productId: productId, count: count);
  }
}
