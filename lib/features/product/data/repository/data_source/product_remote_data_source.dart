import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/product/data/models/product_response/product_dto.dart';

abstract class ProductRemoteDataSource {
  Future<Either<Failures, List<ProductDTO>>> getAllProducts();
}
