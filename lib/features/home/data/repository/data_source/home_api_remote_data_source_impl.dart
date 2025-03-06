import 'package:dartz/dartz.dart';

import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/home/data/manager/home_tab_api_manager.dart';
import 'package:shopping_app/features/home/data/models/brand_response/brand_response.dart';
import 'package:shopping_app/features/home/data/models/category_response/category_response.dart';
import 'package:shopping_app/features/home/data/repository/data_source/home_remote_data_source_contract.dart';

class HomeApiRemoteDataSourceImpl implements HomeRemoteDataSourceContract {
  HomeTabApiManager apiManager;
  HomeApiRemoteDataSourceImpl({
    required this.apiManager,
  });
  @override
  Future<Either<Failures, BrandResponse>> getAllBrands() async {
    final either = await apiManager.getAllBrands();
    return either.fold((le) {
      return Left(le);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, CategoryResponse>> getAllCategories() async {
    final either = await apiManager.getAllCategories();
    return either.fold((le) {
      return Left(le);
    }, (response) {
      return Right(response);
    });
  }
}
