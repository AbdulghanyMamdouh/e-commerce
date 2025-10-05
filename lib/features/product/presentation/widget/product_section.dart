import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/di/di.dart';
import 'package:shopping_app/core/utils/loading_indicator.dart';
import 'package:shopping_app/features/cart/presentation/cubit/cart_view_model.dart';
import 'package:shopping_app/features/favorite/presentation/cubit/favorite_view_model.dart';
import 'package:shopping_app/features/product/presentation/cubit/product_states.dart';

import 'package:shopping_app/features/product/presentation/cubit/product_view_model.dart';
import 'package:shopping_app/features/product/presentation/screen/product_details_screen.dart';
import 'package:shopping_app/features/product/presentation/widget/product_item.dart';

class ProductSection extends StatelessWidget {
  ProductSection({
    super.key,
  });
  final ProductViewModel viewModel =
      ProductViewModel(getAllProductsUseCase: injectGetAllProductsUseCase());
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FavoriteViewModel(favoriteUseCase: injectFavoriteUseCase());
          },
        ),
        BlocProvider(
          create: (context) {
            return CartViewModel(cartUseCase: injectCartUseCase());
          },
        ),
      ],
      child: BlocBuilder<ProductViewModel, ProductStates>(
          bloc: viewModel..getAllProducts(),
          builder: (_, state) {
            if (state is ProductLoadingState) {
              return const LoadingIndicator();
            } else if (state is ProductErrorState) {
              return Text(state.errorMessage);
            } else if (state is ProductSuccessState) {
              return GridView.builder(
                  itemCount: state.products.length,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.w,
                    crossAxisSpacing: 10.h,
                    childAspectRatio: 2 / 2.9,
                  ),
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          ProductDetailsScreen.routeName,
                          arguments: state.products[index],
                        );
                      },
                      child: ProductItem(
                        cartViewModel: context.read<CartViewModel>(),
                        favoriteViewModel: context.read<FavoriteViewModel>(),
                        product: state.products[index],
                      ),
                    );
                  });
            } else {
              return const SizedBox();
              // or any other widget to show empty state here
            }
          }),
    );
  }
}
