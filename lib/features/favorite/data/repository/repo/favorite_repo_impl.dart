import 'package:dartz/dartz.dart';

import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/favorite/domain/entity/favorite_product_entity.dart';
import 'package:shopping_app/features/favorite/domain/repository/data_source/favorite_remote_data_source_contract.dart';
import 'package:shopping_app/features/favorite/domain/repository/repo/favorite_repo_contract.dart';

class FavoriteRepoImpl extends FavoriteRepoContract {
  FavoriteRemoteDataSourceContract remoteDataSource;
  FavoriteRepoImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failures, String>> addProductToWishList(
      {required String productId}) {
    return remoteDataSource.addProductToWishList(productId: productId);
  }

  @override
  Future<Either<Failures, FavoriteProductEntity>> getWishList() {
    return remoteDataSource.getWishList();
  }

  @override
  Future<Either<Failures, String>> removeProductFromWishList(
      {required String productId}) {
    return remoteDataSource.removeProductFromWishList(productId: productId);
  }
}
