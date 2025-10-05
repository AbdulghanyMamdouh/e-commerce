import 'package:shopping_app/features/favorite/domain/entity/favorite_product_entity.dart';

abstract class FavoriteStates {}

class FavoriteInitialStates extends FavoriteStates {}

class GetFavoriteLoadingState extends FavoriteStates {}

class GetFavoriteSuccessState extends FavoriteStates {
  final FavoriteProductEntity favoriteProductEntity;

  GetFavoriteSuccessState({required this.favoriteProductEntity});
}

class GetFavoriteErrorState extends FavoriteStates {
  final String errMsg;

  GetFavoriteErrorState({required this.errMsg});
}

class AddToFavoriteLoadingState extends FavoriteStates {}

class AddToFavoriteSuccessState extends FavoriteStates {
  final String sucMsg;

  AddToFavoriteSuccessState({required this.sucMsg});
}

class AddToFavoriteErrorState extends FavoriteStates {
  final String errMsg;

  AddToFavoriteErrorState({required this.errMsg});
}

class RemoveFromFavoriteLoadingState extends FavoriteStates {}

class RemoveFromFavoriteSuccessState extends FavoriteStates {
  final String sucMsg;

  RemoveFromFavoriteSuccessState({required this.sucMsg});
}

class RemoveFromFavoriteErrorState extends FavoriteStates {
  final String errMsg;

  RemoveFromFavoriteErrorState({required this.errMsg});
}

class IsProductInWishListTrue extends FavoriteStates {}

class IsProductInWishListFalse extends FavoriteStates {}
