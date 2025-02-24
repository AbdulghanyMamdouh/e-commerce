import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/auth/domain/entities/auth_result_entity.dart';
import 'package:shopping_app/features/auth/domain/repository/repository/auth_repository_contract.dart';

class AuthUseCase {
  AuthRepositoryContract authRepositoryContract;

  AuthUseCase(this.authRepositoryContract);
  Future<Either<Failures, AuthResultEntity>> login(
    String email,
    String passowrd,
  ) {
    return authRepositoryContract.login(email, passowrd);
  }

  Future<Either<Failures, AuthResultEntity>> register(
      String? name, String? email, String? password, String? phoneNo) {
    return authRepositoryContract.register(name, password, email, phoneNo);
  }
}
