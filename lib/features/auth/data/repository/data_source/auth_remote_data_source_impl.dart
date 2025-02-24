import 'package:dartz/dartz.dart';
import 'package:shopping_app/features/auth/data/manager/auth_api_manager.dart';
import 'package:shopping_app/core/utils/failure.dart';
import 'package:shopping_app/features/auth/domain/entities/auth_result_entity.dart';
import 'package:shopping_app/features/auth/domain/repository/data_source/auth_remote_data_source_contract.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSourceContract {
  AuthApiManager apiManager;
  AuthRemoteDataSourceImpl({
    required this.apiManager,
  });

  @override
  Future<Either<Failures, AuthResultEntity>> login(
      {String email = '', String password = ''}) async {
    final either = await apiManager.login(email, password);
    return either.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r.toAuthResultEntity());
    });
  }

  @override
  Future<Either<Failures, AuthResultEntity>> register(
      {String? name, String? password, String? email, String? phoneNo}) async {
    final either = await apiManager.register(name, email, password, phoneNo);
    return either.fold((le) {
      return Left(le);
    }, (r) {
      return Right(r.toAuthResultEntity());
    });
  }
}
