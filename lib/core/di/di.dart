import 'package:shopping_app/features/auth/data/manager/auth_api_manager.dart';
import 'package:shopping_app/features/auth/data/repository/data_source/auth_remote_data_source_impl.dart';
import 'package:shopping_app/features/auth/data/repository/repository/auth_repository_impl.dart';
import 'package:shopping_app/features/auth/domain/repository/data_source/auth_remote_data_source_contract.dart';
import 'package:shopping_app/features/auth/domain/repository/repository/auth_repository_contract.dart';
import 'package:shopping_app/features/auth/domain/usecase/auth_use_case.dart';

AuthUseCase injectUseCase() {
  return AuthUseCase(injectAuthRepositoryContract());
}

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImpl(injectAuthRemoteDataSourceContract());
}

AuthRemoteDataSourceContract injectAuthRemoteDataSourceContract() {
  return AuthRemoteDataSourceImpl(apiManager: AuthApiManager.getInstance());
}
