import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopping_app/core/constants/api_constatnt.dart';
import 'package:shopping_app/core/di/di.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/product/data/models/product_response/product_dto.dart';
import 'package:shopping_app/features/product/data/models/product_response/product_response.dart';

class ProductTabApiManager {
  ProductTabApiManager._();
  static ProductTabApiManager? _instance;
  static ProductTabApiManager getInstance() {
    _instance ??= ProductTabApiManager._();
    return _instance!;
  }

  Future<Either<Failures, List<ProductDTO>>> getAllProducts() async {
    var connectivity = await Connectivity().checkConnectivity();
    if (connectivity.contains(ConnectivityResult.mobile) ||
        connectivity.contains(ConnectivityResult.wifi)) {
      // Fetch products from API
      try {
        final response = await dio.get(ApiConstatnt.getAllProducts);
        final productResponse = ProductResponse.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(productResponse.data!);
        } else {
          return Left(ServerError(
              errorMessage: response.data['message'] ??
                  response.statusMessage ??
                  'Server Error'));
        }
      } on DioException catch (err) {
        return Left(NetworkError(errorMessage: err.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'check your internet connection.!'));
    }
  }
}
