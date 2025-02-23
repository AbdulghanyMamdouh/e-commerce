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
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // connected to network

      // Create request body with user data
      var registerRequest = RegisterRequest(
        name: name,
        email: email,
        password: password,
        phone: phoneNo,
      );
      final response = await _dio.post(
        ApiConstatnt.register,
        data: registerRequest.toJson,
      );
      final registerResponse = RegisterResponseDTO.fromJson(response.data);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        // success

        return Right(registerResponse);
      } else {
        // failure
        return Left(ServerError(
          errorMessage: registerResponse.errors != null
              ? registerResponse.errors!.msg!
              : registerResponse.message,
        ));
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
    var connectivtyResult = await Connectivity().checkConnectivity();
    if (connectivtyResult == ConnectivityResult.mobile ||
        connectivtyResult == ConnectivityResult.wifi) {
      // connected to network
      var loginRequest = LoginRequest(
        email: email,
        password: password,
      );
      final response = await _dio.post(
        ApiConstatnt.login,
        data: loginRequest.toJson,
      );
      final loginResponse = LoginResponseDTO.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        // success
        return Right(loginResponse);
      } else {
        // failure from server
        return Left(
          ServerError(
              errorMessage: loginResponse.message ??= "can't fetch data!."),
        );
      }
    } else {
      // not connected to network
      return Left(
        NetworkError(
          errorMessage: 'check your internet connection!.',
        ),
      );
    }
  }
}
