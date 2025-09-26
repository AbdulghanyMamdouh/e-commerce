import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/product/domain/use_cases/get_all_products_use_case.dart';
import 'package:shopping_app/features/product/presentation/cubit/product_states.dart';

class ProductViewModel extends Cubit<ProductStates> {
  ProductViewModel({required this.getAllProductsUseCase})
      : super(ProductInitialState());
  GetAllProductsUseCase getAllProductsUseCase;
  Future<void> getAllProducts() async {
    emit(ProductLoadingState());
    final either = await getAllProductsUseCase.getAllProducts();
    either.fold(
      (err) {
        emit(ProductErrorState(errorMessage: err.errorMessage!));
      },
      (response) {
        emit(ProductSuccessState(products: response));
      },
    );
  }
}
