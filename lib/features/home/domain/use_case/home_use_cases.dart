import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/home/domain/entity/brand_response/brand_entity.dart';
import 'package:shopping_app/features/home/domain/entity/category_response/category_entity.dart';
import 'package:shopping_app/features/home/domain/repository/repository/home_repository_contract.dart';

class HomeUseCases {
  HomeRepositoryContract homeRepositoryContract;

  HomeUseCases({
    required this.homeRepositoryContract,
  });
  Future<Either<Failures, List<CategoryEntity>>> getAllCategories() {
    return homeRepositoryContract.getAllCategory();
  }

  Future<Either<Failures, List<BrandEntity>>> getAllBrands() {
    return homeRepositoryContract.getAllBrands();
  }
}
