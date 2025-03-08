import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/product/domain/entity/product_entity.dart';
import 'package:shopping_app/features/product/domain/repository/product_repository_contruct.dart';

class GetAllProductsUseCase {
  ProductRepositoryContruct productRepositoryContruct;
  GetAllProductsUseCase({
    required this.productRepositoryContruct,
  });
  Future<Either<Failures, List<ProductEntity>>> getAllProducts() async {
    return await productRepositoryContruct.getAllProducts();
  }
}
