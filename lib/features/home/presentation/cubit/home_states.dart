import 'package:shopping_app/features/home/domain/entity/brand_response/brand_entity.dart';
import 'package:shopping_app/features/home/domain/entity/category_response/category_entity.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeChangedState extends HomeStates {}

class GetCategoryLoadingState extends HomeStates {}

class GetCategoryErrorState extends HomeStates {
  final String errorMessage;

  GetCategoryErrorState({required this.errorMessage});
}

class GetCategorySuccessState extends HomeStates {
  final List<CategoryEntity> categories;

  GetCategorySuccessState({required this.categories});
}

class GetBrandLoadingState extends HomeStates {}

class GetBrandErrorState extends HomeStates {
  final String errorMessage;

  GetBrandErrorState({required this.errorMessage});
}

class GetBrandSuccessState extends HomeStates {
  final List<BrandEntity> brands;

  GetBrandSuccessState({required this.brands});
}
