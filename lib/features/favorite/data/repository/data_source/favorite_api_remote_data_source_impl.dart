import 'package:dartz/dartz.dart';

import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/favorite/data/manager/favorite_api_manager.dart';
import 'package:shopping_app/features/favorite/domain/entity/favorite_product_entity.dart';
import 'package:shopping_app/features/favorite/domain/repository/data_source/favorite_remote_data_source_contract.dart';

class FavoriteApiRemoteDataSourceImpl extends FavoriteRemoteDataSourceContract {
  FavoriteApiManager favoriteApiManager;
  FavoriteApiRemoteDataSourceImpl({
    required this.favoriteApiManager,
  });
  @override
  Future<Either<Failures, String>> addProductToWishList(
      {required String productId}) {
    return favoriteApiManager.addProductToWishList(productId: productId);
  }

  @override
  Future<Either<Failures, FavoriteProductEntity>> getWishList() {
    return favoriteApiManager.getWishList();
  }

  @override
  Future<Either<Failures, String>> removeProductFromWishList(
      {required String productId}) {
    return favoriteApiManager.removeProductFromWishList(productId: productId);
  }
}
