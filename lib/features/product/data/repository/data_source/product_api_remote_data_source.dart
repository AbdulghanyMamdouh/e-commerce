import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/product/data/manager/product_tab_api_manager.dart';
import 'package:shopping_app/features/product/data/models/product_response/product_dto.dart';
import 'package:shopping_app/features/product/data/repository/data_source/product_remote_data_source.dart';

class ProductApiRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ProductTabApiManager productTabApiManager;

  ProductApiRemoteDataSourceImpl({required this.productTabApiManager});
  @override
  Future<Either<Failures, List<ProductDTO>>> getAllProducts() async {
    return await productTabApiManager.getAllProducts();
  }
}
