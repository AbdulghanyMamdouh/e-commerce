import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/constants/api_constatnt.dart';
import 'package:shopping_app/core/di/di.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/favorite/data/model/favorite_response/favorite_response_dto.dart';

class FavoriteApiManager {
  FavoriteApiManager._();
  static FavoriteApiManager? _instance;
  static FavoriteApiManager getInstance() {
    _instance ??= FavoriteApiManager._();
    return _instance!;
  }

  Future<Either<Failures, String>> addProductToWishList(
      {required String productId}) async {
    var connectivity = await Connectivity().checkConnectivity();
    if (connectivity.contains(ConnectivityResult.mobile) ||
        connectivity.contains(ConnectivityResult.wifi)) {
      try {
        final response = await dio.post(ApiConstatnt.wishlist, data: {
          "productId": productId,
        });
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(response.data['message'] ??
              'Product added to wishlist successfully');
        } else {
          return Left(ServerError(
              errorMessage: response.data['message'] ??
                  response.statusMessage ??
                  'Invalid Token. please login again'));
        }
      } catch (e) {
        return Left(ServerError(errorMessage: e.toString()));
      }
    } else {
      return Left(
        NetworkError(errorMessage: 'No Internet Connection!'),
      );
    }
  }

  Future<Either<Failures, String>> removeProductFromWishList(
      {required String productId}) async {
    var connectivity = await Connectivity().checkConnectivity();
    if (connectivity.contains(ConnectivityResult.mobile) ||
        connectivity.contains(ConnectivityResult.wifi)) {
      try {
        final response = await dio.delete(
          '${ApiConstatnt.wishlist}/$productId',
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(response.data['message'] ??
              'Product removed from wishlist successfully');
        } else {
          return Left(ServerError(
              errorMessage: response.data['message'] ??
                  response.statusMessage ??
                  'Invalid Token. please login again'));
        }
      } catch (e) {
        return Left(ServerError(errorMessage: e.toString()));
      }
    } else {
      return Left(
        NetworkError(errorMessage: 'No Internet Connection!'),
      );
    }
  }

  Future<Either<Failures, FavoriteResponseDTO>> getWishList() async {
    var connectivity = await Connectivity().checkConnectivity();
    if (connectivity.contains(ConnectivityResult.mobile) ||
        connectivity.contains(ConnectivityResult.wifi)) {
      try {
        final response = await dio.get(ApiConstatnt.wishlist);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          final favoriteResponse = FavoriteResponseDTO.fromJson(response.data);
          if (response.data['data'].toString() == '[]') {
            return Left(Failures(errorMessage: 'Your Cart Is Empty.!'));
          }
          return Right(favoriteResponse);
        } else {
          return Left(Failures(
              errorMessage: response.data['message'] ??
                  response.statusMessage ??
                  'Invalid Token. please login again'));
        }
      } catch (e) {
        return Left(ServerError(errorMessage: e.toString()));
      }
    } else {
      return Left(
        NetworkError(errorMessage: 'No Internet Connection!'),
      );
    }
  }
}
