import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/di/di.dart';
import 'package:shopping_app/core/theme/color_manager.dart';
import 'package:shopping_app/core/utils/custom_dialog.dart';
import 'package:shopping_app/core/widgets/default_button_cart_product_screen.dart';
import 'package:shopping_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:shopping_app/features/cart/presentation/cubit/cart_view_model.dart';
import 'package:shopping_app/features/cart/presentation/widget/product_cart_item.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart';

  CartScreen({super.key});

  final CartViewModel viewModel =
      CartViewModel(cartUseCase: injectCartUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getUserCart(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
            style: TextStyle(
              color: ColorManager.primary,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocConsumer<CartViewModel, CartStates>(
            // bloc: viewModel,
            listener: (context, state) async {
          if (state is UpdateCartLoadingState ||
              state is RemoveFromCartLoadingState) {
            CustomDialog.showLoading(context);
          } else if (state is UpdateCartSuccessState ||
              state is RemoveFromCartSuccessState) {
            CustomDialog.hideLoading(context);
            if (state is UpdateCartSuccessState) {
              CustomDialog.showMessage(state.message);
            } else if (state is RemoveFromCartSuccessState) {
              CustomDialog.showMessage(state.message);
            }
          } else if (state is UpdateCartErrorState) {
            CustomDialog.hideLoading(context);
            CustomDialog.showMessage(state.errMsg);
          } else if (state is RemoveFromCartErrorState) {
            CustomDialog.hideLoading(context);
            CustomDialog.showMessage(state.errMsg);
          }
        }, builder: (context, state) {
          if (state is GetCartLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetCartErrorState) {
            if (state.error == '') {
              return Column(
                // mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(
                    height: 150.h,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/wf.png',
                      height: 350.h,
                      width: 250.w,
                      // color: Colors.blue.shade100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Your cart is empty',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ColorManager.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,
                        ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text(state.error),
              );
            }
          }
          {
            if (viewModel.cartData?.data?.product.isEmpty ?? true) {
              return Column(
                // mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(
                    height: 150.h,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/wf.png',
                      height: 350.h,
                      width: 250.w,
                      // color: Colors.blue.shade100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Your cart is empty',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ColorManager.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,
                        ),
                  ),
                ],
              );
            }

            return Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ProductCartItem(
                            // cartData: state.cartData,
                            // viewModel.cartData,
                            index: index, viewModel: viewModel,
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(
                              height: 8,
                            ),
                        itemCount:
                            viewModel.cartData?.data?.product.length ?? 5),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      bottom: 60.0.h,
                      left: 10.w,
                      right: 10.w,
                    ),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Total price\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 20.sp,
                                      color: ColorManager.textColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              TextSpan(
                                text:
                                    'EGP ${viewModel.cartData?.data?.totalCartPrice ?? 0} ',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 20.sp,
                                      color: ColorManager.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        DefaultButtonCartProductScreen(
                          icon: const Icon(Icons.arrow_forward),
                          iconAlignment: IconAlignment.end,
                          onPressed: () {},
                          label: 'Check Out',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
