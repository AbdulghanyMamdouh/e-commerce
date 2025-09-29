import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/di/di.dart';
import 'package:shopping_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:shopping_app/features/cart/presentation/cubit/cart_view_model.dart';
import 'package:shopping_app/features/cart/presentation/widget/product_cart_item.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart';
  String productId = '64b8f1f4e4b0c6b1d4e4f8a1';
  CartScreen({super.key});
  final CartViewModel viewModel =
      CartViewModel(cartUseCase: injectCartUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: BlocBuilder(
            bloc: viewModel..getUserCart(),
            builder: (context, state) {
              if (state is GetCartLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetCartErrorState) {
                print("state.error: ${state.error}");
                return Center(
                  child: Text(state.error),
                );
              } else if (state is GetCartSuccessState) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ProductCartItem(
                          cartData: state.cartData,
                          // viewModel.cartData,
                          index: index,
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(
                            height: 8,
                          ),
                      itemCount: state.cartData?.data?.product.length ?? 5),
                );
              } else {
                return Container(
                  child: Text('Something went wrong!'),
                );
              }
            }
            // child: Container(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ListView.separated(
            //       itemBuilder: (context, index) => ProductCartItem(
            //             viewModel: viewModel,
            //             index: index,
            //           ),
            //       separatorBuilder: (_, __) => const SizedBox(
            //             height: 8,
            //           ),
            //       itemCount: viewModel.cartData?.data?.product.length ?? 5),
            // ),

            ),
      ),
    );
  }
}
