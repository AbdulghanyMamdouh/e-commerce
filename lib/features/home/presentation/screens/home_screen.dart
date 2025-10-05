import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/di/di.dart';
import 'package:shopping_app/features/home/presentation/cubit/home_states.dart';
import 'package:shopping_app/features/home/presentation/cubit/home_view_model.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const String routeName = '/home';
  // final HomeViewModel viewModel = HomeViewModel(useCase: injectHomeUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
      // bloc: viewModel,
      builder: (context, state) {
        final viewModel = context.read<HomeViewModel>();
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: customBottomNavigationBar(
                selectedIndex: viewModel.currentIndex,
                context: context,
                onTap: (newSelectedIndex) {
                  viewModel.changeTabs(newSelectedIndex);
                }),
            body: viewModel.tabs[viewModel.currentIndex],
          ),
        );
      },
    );
  }
}
