import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/favorite/domain/entity/favorite_product_Entity.dart';

abstract class FavoriteRemoteDataSourceContract {
  Future<Either<Failures, String>> addProductToWishList(
      {required String productId});
  Future<Either<Failures, String>> removeProductFromWishList(
      {required String productId});

  Future<Either<Failures, FavoriteProductEntity>> getWishList();
}
