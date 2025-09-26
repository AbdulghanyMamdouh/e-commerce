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
import 'package:shopping_app/features/home/data/repository/data_source/home_remote_data_source_contract.dart';
import 'package:shopping_app/features/home/data/repository/repository/home_repository_impl.dart';
import 'package:shopping_app/features/home/domain/repository/repository/home_repository_contract.dart';
import 'package:shopping_app/features/home/domain/use_case/home_use_cases.dart';
import 'package:shopping_app/features/product/data/manager/product_tab_api_manager.dart';
import 'package:shopping_app/features/product/data/repository/data_source/product_api_remote_data_source.dart';
import 'package:shopping_app/features/product/data/repository/data_source/product_remote_data_source.dart';
import 'package:shopping_app/features/product/data/repository/repository/product_repository_impl.dart';
import 'package:shopping_app/features/product/domain/repository/product_repository_contruct.dart';
import 'package:shopping_app/features/product/domain/use_cases/get_all_products_use_case.dart';

GetAllProductsUseCase injectGetAllProductsUseCase() {
  return GetAllProductsUseCase(
      productRepositoryContruct: injectProductRepositoryContruct());
}

ProductRepositoryContruct injectProductRepositoryContruct() {
  return ProductRepositoryImpl(
      productRemoteDataSource: injectProductRemoteDataSource());
}

ProductRemoteDataSource injectProductRemoteDataSource() {
  return ProductApiRemoteDataSourceImpl(
      productTabApiManager: ProductTabApiManager.getInstance());
}

HomeUseCases injectHomeUseCase() {
  return HomeUseCases(homeRepositoryContract: injectHomeRepositoryContract());
}

HomeRepositoryContract injectHomeRepositoryContract() {
  return HomeRepositoryImpl(dataSource: injectHomeApiRemoteDataSourceImpl());
}

HomeRemoteDataSourceContract injectHomeApiRemoteDataSourceImpl() {
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
