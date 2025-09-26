import 'package:shopping_app/features/product/domain/entity/product_entity.dart';

abstract class ProductStates {}

class ProductInitialState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductErrorState extends ProductStates {
  // Handle errors here
  String errorMessage;
  ProductErrorState({
    required this.errorMessage,
  });
}

class ProductSuccessState extends ProductStates {
  // Handle successful state here
  List<ProductEntity> products;
  ProductSuccessState({
    required this.products,
  });
}
