import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping_app/features/product/presentation/screen/product_tab.dart';
import 'package:shopping_app/features/favorite/presentation/screen/favorite_tab.dart';
import 'package:shopping_app/features/home/domain/use_case/home_use_cases.dart';
import 'package:shopping_app/features/home/presentation/cubit/home_states.dart';
import 'package:shopping_app/features/home/presentation/widgets/home_tab.dart';
import 'package:shopping_app/features/profile/presentation/screen/profile_tab.dart';

class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel({
    required this.useCase,
  }) : super(HomeInitialState());
  List<Widget> tabs = [
    const HomeTab(),
    const ProductTab(),
    const FavoriteTab(),
    const ProfileTab(),
  ];
  int currentIndex = 0;
  final HomeUseCases useCase;
  void changeTabs(int newSelectedIndex) {
    emit(HomeInitialState());
    currentIndex = newSelectedIndex;
    emit(HomeChangedState());
  }

  Future<void> getAllCategories() async {
    emit(GetCategoryLoadingState());
    final either = await useCase.getAllCategories();
    either.fold((le) {
      emit(GetCategoryErrorState(
          errorMessage: le.errorMessage ?? 'some errors'));
    }, (response) {
      emit(GetCategorySuccessState(categories: response));
    });
  }

  Future<void> getAllBrands() async {
    emit(GetBrandLoadingState());
    final either = await useCase.getAllBrands();
    either.fold((le) {
      emit(GetBrandErrorState(errorMessage: le.errorMessage ?? 'Some errors'));
    }, (response) {
      emit(GetBrandSuccessState(brands: response));
    });
  }
}
