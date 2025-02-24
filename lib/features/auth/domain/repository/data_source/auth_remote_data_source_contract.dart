import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/auth/domain/entities/auth_result_entity.dart';

abstract class AuthRemoteDataSourceContract {
  Future<Either<Failures, AuthResultEntity>> register(
      {String? name, String? password, String? email, String? phoneNo});
  Future<Either<Failures, AuthResultEntity>> login(
      {String email, String password});
}
