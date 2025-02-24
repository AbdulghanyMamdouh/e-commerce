import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopping_app/core/constants/api_constatnt.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/auth/data/models/request/login_request.dart';
import 'package:shopping_app/features/auth/data/models/request/register_request.dart';
import 'package:shopping_app/features/auth/data/models/response/login/login_response_dto.dart';
import 'package:shopping_app/features/auth/data/models/response/register/register_response_dto.dart';
import 'package:shopping_app/features/auth/domain/entities/auth_result_entity.dart';

class AuthApiManager {
  AuthApiManager._();
  static AuthApiManager? _instance;

  static AuthApiManager getInstance() {
    _instance ??= AuthApiManager._();
    return _instance!;
  }

  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstatnt.baseUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  Future<Either<Failures, RegisterResponseDTO>> register(
      String? name, String? email, String? password, String? phoneNo) async {
    var connectivityResults =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi)) {
      // connected to network

      // Create request body with user data
      try {
        var registerRequest = RegisterRequest(
          name: name,
          email: email,
          password: password,
          phone: phoneNo,
        );
        final response = await _dio.post(
          ApiConstatnt.register,
          data: registerRequest.toJson(),
        );
        final registerResponse = RegisterResponseDTO.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          // success

          return Right(registerResponse);
        } else {
          // server error
          return Left(
            ServerError(errorMessage: response.data["message"] ?? 'unknown'),
          );
        }
      } on DioException catch (e) {
        // server error
        return Left(
          ServerError(errorMessage: e.response!.data["message"] ?? 'unknown'),
        );
      }
    } else {
      // not connected to network
      return Left(
        NetworkError(
          errorMessage: 'check your internet connection',
        ),
      );
    }
  }

  Future<Either<Failures, LoginResponseDTO>> login(
      String? email, String? password) async {
    var connectivityResults = await Connectivity().checkConnectivity();

    if (connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi)) {
      try {
        var loginRequest = LoginRequest(
          email: email,
          password: password,
        );

        final response = await _dio.post(
          ApiConstatnt.login,
          data: loginRequest.toJson(),
        );

        // ✅ التحقق من كود الاستجابة قبل فك البيانات
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          final loginResponse = LoginResponseDTO.fromJson(response.data);
          return Right(loginResponse);
        } else {
          return Left(ServerError(
              errorMessage: response.data["message"] ?? "Unexpected error!"));
        }
      } on DioException catch (e) {
        // ✅ التعامل مع الأخطاء القادمة من السيرفر بشكل صحيح
        if (e.response?.statusCode == 400) {
          return Left(ServerError(
              errorMessage:
                  e.response?.data["message"] ?? "Invalid email or password"));
        } else {
          return Left(ServerError(
              errorMessage: e.response?.data["message"] ?? "Unexpected error"));
        }
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Check your internet connection!'));
    }
  }

  // Future<Either<Failures, LoginResponseDTO>> login(
  //     String? email, String? password) async {
  //   var connectivityResults = await Connectivity().checkConnectivity();
  //   if (connectivityResults.contains(ConnectivityResult.mobile) ||
  //       connectivityResults.contains(ConnectivityResult.wifi)) {
  //     // connected to network
  //     var loginRequest = LoginRequest(
  //       email: email,
  //       password: password,
  //     );
  //     final response = await _dio.post(
  //       ApiConstatnt.login,
  //       data: loginRequest.toJson(),
  //     );
  //     final loginResponse = LoginResponseDTO.fromJson(response.data);
  //     if (response.statusCode! >= 200 && response.statusCode! < 300) {
  //       // success
  //       return Right(loginResponse);
  //     } else {
  //       // failure from server
  //       return Left(
  //         ServerError(
  //             errorMessage: loginResponse.message ??= "can't fetch data!."),
  //       );
  //     }
  //   } else {
  //     // not connected to network
  //     return Left(
  //       NetworkError(
  //         errorMessage: 'check your internet connection!.',
  //       ),
  //     );
  //   }
  // }
}
