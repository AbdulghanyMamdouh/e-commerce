import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopping_app/core/constants/api_constatnt.dart';
import 'package:shopping_app/core/di/di.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/home/data/models/brand_response/brand_response.dart';
import 'package:shopping_app/features/home/data/models/category_response/category_response.dart';

class HomeTabApiManager {
  HomeTabApiManager._();
  static HomeTabApiManager? _instance;
  static HomeTabApiManager getInstance() {
    _instance ??= HomeTabApiManager._();
    return _instance!;
  }

  Future<Either<Failures, CategoryResponse>> getAllCategories() async {
    var connectivityResults =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi)) {
      try {
        final response = await dio.get(ApiConstatnt.getAllCategory);
        final categoryResponse = CategoryResponse.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoryResponse);
        } else {
          return Left(
            ServerError(
                errorMessage: response.data['message'] ?? 'unknown error'),
          );
        }
      } on DioException catch (e) {
        return Left(ServerError(
            errorMessage: e.response == null
                ? 'No internet connection available...'
                : e.response!.data['message'] ?? 'unknown error message'));
      }
    } else {
      return Left(
        NetworkError(errorMessage: 'check your internet connection.!'),
      );
    }
  }

  Future<Either<Failures, BrandResponse>> getAllBrands() async {
    var connectivityResults =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi)) {
      try {
        final response = await dio.get(ApiConstatnt.gatAllBrands);
        final brandResponse = BrandResponse.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(brandResponse);
        } else {
          return Left(
            ServerError(
                errorMessage: response.data['message'] ?? 'unknown error'),
          );
        }
      } on DioException catch (e) {
        return Left(ServerError(
            errorMessage: e.response == null
                ? 'No internet connection available...'
                : e.response!.data['message'] ?? 'unknown error message'));
      }
    } else {
      return Left(
        NetworkError(errorMessage: 'check your internet connection.!'),
      );
    }
  }
}
