import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/product/domain/entity/product_entity.dart';

abstract class ProductRepositoryContruct {
  Future<Either<Failures, List<ProductEntity>>> getAllProducts();
}
