import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/core/di/di.dart';
import 'package:shopping_app/core/theme/color_manager.dart';
import 'package:shopping_app/core/utils/custom_dialog.dart';
import 'package:shopping_app/core/widgets/default_button_cart_product_screen.dart';
import 'package:shopping_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:shopping_app/features/cart/presentation/cubit/cart_view_model.dart';
import 'package:shopping_app/features/favorite/presentation/cubit/favorite_states.dart';
import 'package:shopping_app/features/favorite/presentation/cubit/favorite_view_model.dart';
import 'package:shopping_app/features/product/domain/entity/product_entity.dart';
import 'package:read_more_text/read_more_text.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = 'product_screen';
  final formatter = NumberFormat.compact(locale: 'en')
    ..maximumFractionDigits = 1;

  ProductDetailsScreen({super.key});
  final CartViewModel viewModel =
      CartViewModel(cartUseCase: injectCartUseCase());
  final FavoriteViewModel favoriteViewModel =
      FavoriteViewModel(favoriteUseCase: injectFavoriteUseCase());
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductEntity;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Details',
          style: TextStyle(
            color: ColorManager.primary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'cart');
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: ColorManager.primary,
              size: 35.sp,
              weight: 1.w,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 8.0.h,
            left: 12.w,
            right: 12.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                    width: 398.w,
                    height: 300.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorManager.navy,
                          width: 2,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    margin: EdgeInsets.all(8.h),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: ImageSlideshow(
                        initialPage: 0,
                        indicatorColor: ColorManager.primary,
                        // indicatorBackgroundColor: ColorManager.white,
                        indicatorBottomPadding: 20.h,
                        indicatorPadding: 8.w,
                        indicatorRadius: 7.h,
                        autoPlayInterval: 3000,
                        isLoop: true,
                        children: product.images!.map((url) {
                          return CachedNetworkImage(
                            imageUrl: url,
                            fit: BoxFit.cover,
                            height: 300.h,
                            width: double.infinity,
                          );
                        }).toList(),
                      ),
                    )),
                Positioned(
                  left: 350.w,
                  top: 18.h,
                  child: CircleAvatar(
                    radius: 24.r,
                    //todo: change color
                    backgroundColor: ColorManager.white,
                    child: BlocListener<FavoriteViewModel, FavoriteStates>(
                      bloc: favoriteViewModel,
                      listener: (context, state) async {
                        if (state is AddToFavoriteLoadingState) {
                          CustomDialog.showLoading(context);
                        } else if (state is AddToFavoriteSuccessState) {
                          CustomDialog.hideLoading(context);

                          // todo : show message
                          CustomDialog.showMessage(
                            state.sucMsg,
                          );
                        } else if (state is AddToFavoriteErrorState) {
                          CustomDialog.hideLoading(context);
                          // todo : show message
                          CustomDialog.showMessage(
                            state.errMsg,
                          );
                        }
                      },
                      child: IconButton(
                        onPressed: () async {
                          await favoriteViewModel.addProductToWishList(
                              productId: product.id!);
                        },
                        icon: const Icon(
                          Icons.favorite_border,
                          //todo: change color
                          color: ColorManager.primary,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: 24.h,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  product.brand?.name ?? '',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 18.sp,
                        color: ColorManager.darkPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'EGP ${product.price}',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 18.sp,
                        color: ColorManager.darkPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ]),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Container(
                    width: 135.w,
                    height: 40.h,
                    padding: EdgeInsets.symmetric(
                      vertical: 3.h,
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorManager.greyColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25.r)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${formatter.format(product.sold)} ',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 20.sp,
                                  color: ColorManager.darkPrimary,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                          ),
                        ),
                        Text(
                          ' Sold',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 20.sp,
                                    color: ColorManager.darkPrimary,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.visible,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  const Icon(
                    Icons.star,
                    color: ColorManager.yellow,
                    size: 34,
                  ),
                  Text(
                    ' ${product.ratingsAverage} (${product.ratingsQuantity}) ',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 20.sp,
                          color: ColorManager.darkPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.r),
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          iconSize: 28.sp,
                          color: ColorManager.white,
                          onPressed: () {},
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          '1',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 20.sp,
                                    color: ColorManager.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        IconButton(
                          iconSize: 28.sp,
                          color: ColorManager.white,
                          onPressed: () {},
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Description',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 20.sp,
                      color: ColorManager.darkPrimary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              ReadMoreText(
                product.description.toString(),
                numLines: 4,
                readMoreText: 'Read more',
                readLessText: 'Read less',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16.sp,
                      color: ColorManager.textColor,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: 90.0.h,
          left: 16.w,
          right: 16.w,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Total price\n',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 20.sp,
                          color: ColorManager.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  TextSpan(
                    text: 'EGP ${product.price}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 20.sp,
                          color: ColorManager.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 30.w,
            ),
            BlocListener<CartViewModel, CartStates>(
              bloc: viewModel,
              listener: (context, state) async {
                if (state is AddToCartLoadingState) {
                  CustomDialog.showLoading(context);
                } else if (state is AddToCartSuccessState) {
                  CustomDialog.hideLoading(context);

                  // todo : show message
                  CustomDialog.showMessage(
                    state.message,
                  );
                } else if (state is AddToCartErrorState) {
                  CustomDialog.hideLoading(context);
                  // todo : show message
                  CustomDialog.showMessage(
                    state.errMsg,
                  );
                }
              },
              child: DefaultButtonCartProductScreen(
                icon: const Icon(Icons.add_shopping_cart),
                iconAlignment: IconAlignment.start,
                onPressed: () {
                  viewModel.addToCart(productId: product.id!);
                },
                label: 'Add to cart',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
