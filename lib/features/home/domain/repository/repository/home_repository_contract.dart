import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/home/domain/entity/brand_response/brand_entity.dart';
import 'package:shopping_app/features/home/domain/entity/category_response/category_entity.dart';

abstract class HomeRepositoryContract {
  Future<Either<Failures, List<CategoryEntity>>> getAllCategory();
  Future<Either<Failures, List<BrandEntity>>> getAllBrands();
}
