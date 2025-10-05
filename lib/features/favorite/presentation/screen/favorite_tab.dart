import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/di/di.dart';
import 'package:shopping_app/core/widgets/custom_app_bar.dart';
import 'package:shopping_app/features/favorite/presentation/cubit/favorite_states.dart';
import 'package:shopping_app/features/favorite/presentation/cubit/favorite_view_model.dart';
import 'package:shopping_app/features/favorite/presentation/widgets/product_favorite_item.dart';

class FavoriteTab extends StatelessWidget {
  FavoriteTab({super.key});
  // final FavoriteViewModel viewModel =
  // FavoriteViewModel(favoriteUseCase: injectFavoriteUseCase());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: BlocProvider<FavoriteViewModel>(
        create: (context) =>
            FavoriteViewModel(favoriteUseCase: injectFavoriteUseCase())
              ..getWishList(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomAppBar(),
            SizedBox(
              height: 16.h,
            ),
            BlocConsumer<FavoriteViewModel, FavoriteStates>(
              listener: (listener, s) {},
              builder: (context, state) {
                if (state is GetFavoriteLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetFavoriteErrorState) {
                  return Center(
                    child: Text(state.errMsg == '' ? 'error' : state.errMsg),
                  );
                } else {
                  final viewModel = context.read<FavoriteViewModel>();
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => ProductFavoriteItem(
                              index: index,
                              viewModel: viewModel,
                            ),
                        separatorBuilder: (_, __) => SizedBox(
                              height: 8.h,
                            ),
                        itemCount:
                            viewModel.product?.favoriteProducts?.length ?? 0),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
