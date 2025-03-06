import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/home/data/models/brand_response/brand_response.dart';
import 'package:shopping_app/features/home/data/models/category_response/category_response.dart';

abstract class HomeRemoteDataSourceContract {
  Future<Either<Failures, CategoryResponse>> getAllCategories();
  Future<Either<Failures, BrandResponse>> getAllBrands();
}
