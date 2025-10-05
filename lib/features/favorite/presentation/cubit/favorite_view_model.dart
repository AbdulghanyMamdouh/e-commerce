import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/favorite/domain/entity/favorite_product_entity.dart';
import 'package:shopping_app/features/favorite/domain/use_case/favorite_use_case.dart';
import 'package:shopping_app/features/favorite/presentation/cubit/favorite_states.dart';

class FavoriteViewModel extends Cubit<FavoriteStates> {
  final FavoriteUseCase favoriteUseCase;
  late FavoriteProductEntity product;
  Set<String> favoriteProducts = {};

  FavoriteViewModel({
    required this.favoriteUseCase,
  }) : super(FavoriteInitialStates());
  Future<void> addProductToWishList({required String productId}) async {
    emit(AddToFavoriteLoadingState());
    final either =
        await favoriteUseCase.addProductToWishList(productId: productId);
    either.fold((fail) {
      emit(
        AddToFavoriteErrorState(errMsg: fail.errorMessage ?? ''),
      );
    }, (sucMsg) {
      favoriteProducts.add(productId);
      emit(
        AddToFavoriteSuccessState(sucMsg: sucMsg),
      );
    });
  }

  Future<void> removeProductFromWishList({required String productId}) async {
    emit(RemoveFromFavoriteLoadingState());
    final either =
        await favoriteUseCase.removeProductFromWishList(productId: productId);
    either.fold((fail) {
      emit(
        RemoveFromFavoriteErrorState(errMsg: fail.errorMessage ?? ''),
      );
    }, (sucMsg) {
      favoriteProducts.remove(productId);
      emit(
        RemoveFromFavoriteSuccessState(sucMsg: sucMsg),
      );
    });
  }

  Future<void> getWishList() async {
    emit(GetFavoriteLoadingState());
    final either = await favoriteUseCase.getWishList();
    either.fold((fail) {
      emit(GetFavoriteErrorState(errMsg: fail.errorMessage ?? ''));
    }, (response) {
      product = response;
      for (var product in response.favoriteProducts!) {
        favoriteProducts.add(product.id);
      }
      emit(
        GetFavoriteSuccessState(favoriteProductEntity: response),
      );
    });
  }

  bool isProductInWishList(String productId) {
    return favoriteProducts.contains(productId);
  }
}
