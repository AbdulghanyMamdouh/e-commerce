import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/auth/domain/entities/auth_result_entity.dart';
import 'package:shopping_app/features/auth/domain/repository/data_source/auth_remote_data_source_contract.dart';
import 'package:shopping_app/features/auth/domain/repository/repository/auth_repository_contract.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSourceContract authRemoteDataSourceContract;

  AuthRepositoryImpl(this.authRemoteDataSourceContract);
  @override
  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password) {
    return authRemoteDataSourceContract.login(
      email: email,
      password: password,
    );
  }

  @override
  Future<Either<Failures, AuthResultEntity>> register(
      String? name, String? password, String? email, String? phoneNo) {
    return authRemoteDataSourceContract.register(
      name: name,
      password: password,
      email: email,
      phoneNo: phoneNo,
    );
  }
}
