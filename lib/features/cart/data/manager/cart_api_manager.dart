import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import 'package:shopping_app/core/constants/api_constatnt.dart';
import 'package:shopping_app/core/di/di.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/cart/data/models/cart_response/cart_response_dto.dart';

class CartApiManager {
  CartApiManager._();
  static CartApiManager? _instance;
  static CartApiManager getInstance() {
    _instance ??= CartApiManager._();
    return _instance!;
  }

  Future<Either<Failures, CartResponseDTO>> removeFromCart(
      String productId) async {
    var connectivity = await Connectivity().checkConnectivity();
    if (connectivity.contains(ConnectivityResult.mobile) ||
        connectivity.contains(ConnectivityResult.wifi)) {
      try {
        final response = await dio.delete(
          '${ApiConstatnt.cart}/$productId',
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          final cartResponse = CartResponseDTO.fromMap(response.data);
          return Right(cartResponse);
        } else if (response.statusCode == 401) {
          return Left(Failures(
              errorMessage: response.data['message'] ??
                  response.statusMessage ??
                  'Invalid Token. please login again'));
        } else {
          return Left(Failures(
              errorMessage: response.data['message'] ??
                  response.statusMessage ??
                  'Server Error'));
        }
      } catch (e) {
        return Left(Failures(errorMessage: e.toString()));
      }
    } else {
      return Left(
        Failures(errorMessage: 'No Internet Connection!'),
      );
    }
  }

  Future<Either<Failures, String>> addToCart(String productId) async {
    var connectivity = await Connectivity().checkConnectivity();
    if (connectivity.contains(ConnectivityResult.mobile) ||
        connectivity.contains(ConnectivityResult.wifi)) {
      try {
        final response = await dio.post(
          ApiConstatnt.cart,
          data: {
            "productId": productId,
          },
        );

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(
            response.data['message'],
          );
        } else if (response.statusCode == 401) {
          return Left(Failures(
              errorMessage: response.data['message'] ??
                  response.statusMessage ??
                  'Invalid Token. please login again'));
        } else {
          return Left(Failures(
              errorMessage: response.data['message'] ??
                  response.statusMessage ??
                  'Server Error'));
        }
      } catch (e) {
        return Left(Failures(errorMessage: e.toString()));
      }
    } else {
      return Left(
        Failures(errorMessage: 'No Internet Connection!'),
      );
    }
  }

  Future<Either<Failures, CartResponseDTO>> updateCart(
      {required String productId, required int count}) async {
    var connectivity = await Connectivity().checkConnectivity();
    if (connectivity.contains(ConnectivityResult.mobile) ||
        connectivity.contains(ConnectivityResult.wifi)) {
      try {
        final response = await dio.put(
          '${ApiConstatnt.cart}/$productId',
          data: {"count": count},
        );
        final cartResponse = CartResponseDTO.fromMap(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(cartResponse);
        } else if (response.statusCode == 401) {
          return Left(Failures(
              errorMessage: response.data['message'] ??
                  response.statusMessage ??
                  'Invalid Token. please login again'));
        } else {
          return Left(Failures(
              errorMessage: response.data['message'] ??
                  response.statusMessage ??
                  'Server Error'));
        }
      } catch (e) {
        return Left(Failures(errorMessage: e.toString()));
      }
    } else {
      return Left(
        Failures(errorMessage: 'No Internet Connection!'),
      );
    }
  }

  Future<Either<Failures, CartResponseDTO>> getCart() async {
    var connectivity = await Connectivity().checkConnectivity();
    if (connectivity.contains(ConnectivityResult.mobile) ||
        connectivity.contains(ConnectivityResult.wifi)) {
      try {
        final response = await dio.get(ApiConstatnt.cart);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          if (response.data['data']["products"].toString() == '[]') {
            return Left(Failures(errorMessage: 'Your Cart Is Empty.!'));
          }
          final cartResponse = CartResponseDTO.fromMap(response.data);
          return Right(cartResponse);
        } else if (response.statusCode == 401) {
          response.data['message'];
          return Left(Failures(
              errorMessage: response.data['message'] ??
                  'Invalid Token. please login again'));
        } else {
          return Left(Failures(
              errorMessage: response.data['status'] ??
                  response.statusMessage ??
                  'Server Error'));
        }
      } catch (exception) {
        return Left(ServerError(errorMessage: exception.toString()));
      }
    } else {
      return Left(
        Failures(errorMessage: 'No Internet Connection!'),
      );
    }
  }
}
