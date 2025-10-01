import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/favorite/domain/entity/favorite_product_Entity.dart';
import 'package:shopping_app/features/favorite/domain/repository/repo/favorite_repo_contract.dart';

class FavoriteUseCase {
  final FavoriteRepoContract favoriteRepoContract;
  FavoriteUseCase({required this.favoriteRepoContract});
  Future<Either<Failures, FavoriteProductEntity>> getWishList() {
    return favoriteRepoContract.getWishList();
  }

  Future<Either<Failures, String>> addProductToWishList(
      {required String productId}) {
    return favoriteRepoContract.addProductToWishList(productId: productId);
  }

  Future<Either<Failures, String>> removeProductFromWishList(
      {required String productId}) {
    return favoriteRepoContract.removeProductFromWishList(productId: productId);
  }

  Future<bool> isProductInWishList(String productId) async {
    final result = await favoriteRepoContract.getWishList();
    return result.fold((l) => false,
        (r) => r.favoriteProducts!.any((item) => item.id == productId));
  }
}
