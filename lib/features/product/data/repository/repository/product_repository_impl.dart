import 'package:dartz/dartz.dart';

import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/product/data/repository/data_source/product_remote_data_source.dart';
import 'package:shopping_app/features/product/domain/entity/product_entity.dart';
import 'package:shopping_app/features/product/domain/repository/product_repository_contruct.dart';

class ProductRepositoryImpl implements ProductRepositoryContruct {
  ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImpl({
    required this.productRemoteDataSource,
  });
  @override
  Future<Either<Failures, List<ProductEntity>>> getAllProducts() async {
    final either = await productRemoteDataSource.getAllProducts();
    return either.fold((err) {
      return Left(Failures(errorMessage: err.errorMessage));
    }, (respose) {
      return Right(respose);
    });
  }
}
