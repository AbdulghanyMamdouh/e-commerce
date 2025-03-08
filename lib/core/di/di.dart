import 'package:dio/dio.dart';
import 'package:shopping_app/core/constants/api_constatnt.dart';
import 'package:shopping_app/features/auth/data/manager/auth_api_manager.dart';
import 'package:shopping_app/features/auth/data/repository/data_source/auth_remote_data_source_impl.dart';
import 'package:shopping_app/features/auth/data/repository/repository/auth_repository_impl.dart';
import 'package:shopping_app/features/auth/domain/repository/data_source/auth_remote_data_source_contract.dart';
import 'package:shopping_app/features/auth/domain/repository/repository/auth_repository_contract.dart';
import 'package:shopping_app/features/auth/domain/usecase/auth_use_case.dart';
import 'package:shopping_app/features/home/data/manager/home_tab_api_manager.dart';
import 'package:shopping_app/features/home/data/repository/data_source/home_api_remote_data_source_impl.dart';
import 'package:shopping_app/features/home/data/repository/repository/home_repository_impl.dart';
import 'package:shopping_app/features/home/domain/repository/repository/home_repository_contract.dart';
import 'package:shopping_app/features/home/domain/use_case/home_use_cases.dart';

HomeUseCases injectHomeUseCase() {
  return HomeUseCases(homeRepositoryContract: injectHomeRepositoryContract());
}

HomeRepositoryContract injectHomeRepositoryContract() {
  return HomeRepositoryImpl(dataSource: injectHomeApiRemoteDataSourceImpl());
}

HomeApiRemoteDataSourceImpl injectHomeApiRemoteDataSourceImpl() {
  return HomeApiRemoteDataSourceImpl(
      apiManager: HomeTabApiManager.getInstance());
}

AuthUseCase injectUseCase() {
  return AuthUseCase(injectAuthRepositoryContract());
}

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImpl(injectAuthRemoteDataSourceContract());
}

AuthRemoteDataSourceContract injectAuthRemoteDataSourceContract() {
  return AuthRemoteDataSourceImpl(apiManager: AuthApiManager.getInstance());
}

final dio = Dio(
  BaseOptions(
    baseUrl: ApiConstatnt.baseUrl,
    receiveDataWhenStatusError: true,
  ),
);
