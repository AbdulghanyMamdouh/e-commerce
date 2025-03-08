import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/home/data/repository/data_source/home_remote_data_source_contract.dart';
import 'package:shopping_app/features/home/domain/entity/brand_response/brand_entity.dart';
import 'package:shopping_app/features/home/domain/entity/category_response/category_entity.dart';
import 'package:shopping_app/features/home/domain/repository/repository/home_repository_contract.dart';

class HomeRepositoryImpl implements HomeRepositoryContract {
  final HomeRemoteDataSourceContract dataSource;
  const HomeRepositoryImpl({
    required this.dataSource,
  });
  @override
  Future<Either<Failures, List<CategoryEntity>>> getAllCategory() async {
    final either = await dataSource.getAllCategories();
    return either.fold((er) {
      return Left(er);
    }, (categoryRespose) {
      return Right(categoryRespose.data ?? []);
    });
  }

  @override
  Future<Either<Failures, List<BrandEntity>>> getAllBrands() async {
    final either = await dataSource.getAllBrands();
    return either.fold((er) {
      return Left(er);
    }, (brandResponse) {
      return Right(brandResponse.data ?? []);
    });
  }
}
