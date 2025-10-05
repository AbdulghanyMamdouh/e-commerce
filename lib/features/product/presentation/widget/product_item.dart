import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shopping_app/core/di/di.dart';
import 'package:shopping_app/core/theme/color_manager.dart';
import 'package:shopping_app/core/utils/custom_dialog.dart';
import 'package:shopping_app/core/utils/error_utils.dart';
import 'package:shopping_app/core/utils/loading_indicator.dart';
import 'package:shopping_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:shopping_app/features/cart/presentation/cubit/cart_view_model.dart';
import 'package:shopping_app/features/favorite/presentation/cubit/favorite_states.dart';
import 'package:shopping_app/features/favorite/presentation/cubit/favorite_view_model.dart';
import 'package:shopping_app/features/product/domain/entity/product_entity.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    Key? key,
    required this.favoriteViewModel,
    required this.cartViewModel,
    required this.product,
  }) : super(key: key);
  final FavoriteViewModel favoriteViewModel;
  final CartViewModel cartViewModel;
  final ProductEntity product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  void initState() {
    widget.favoriteViewModel.getWishList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: 191.w,
      height: 357.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  //todo: imageCoverURL
                  imageUrl: widget.product.imageCover ??
                      'https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg',
                  placeholder: (context, url) => const LoadingIndicator(),
                  errorWidget: (context, url, error) => const ErrorUtils(),

                  fit: BoxFit.fill,
                  width: 191.w,
                  height: 128.h,
                ),
              ),
              Positioned(
                left: 120.w,
                top: 8.h,
                child: BlocConsumer<FavoriteViewModel, FavoriteStates>(
                  bloc: widget.favoriteViewModel,
                  listener: (context, state) {
                    if (state is AddToFavoriteLoadingState ||
                        state is RemoveFromFavoriteLoadingState) {
                      CustomDialog.showMessage('loading..');
                    } else if (state is AddToFavoriteErrorState) {
                      CustomDialog.showMessage(
                        state.errMsg,
                      );
                    } else if (state is RemoveFromFavoriteErrorState) {
                      CustomDialog.showMessage(
                        state.errMsg,
                      );
                    } else if (state is AddToFavoriteSuccessState) {
                      CustomDialog.showMessage(
                        state.sucMsg,
                      );
                    } else if (state is RemoveFromFavoriteSuccessState) {
                      CustomDialog.showMessage(
                        state.sucMsg,
                      );
                    }
                  },
                  builder: (context, state) {
                    return CircleAvatar(
                      radius: 24.r,
                      //todo: change color
                      backgroundColor: ColorManager.white,
                      child: IconButton(
                        onPressed: () async {
                          widget.favoriteViewModel
                                  .isProductInWishList(widget.product.id!)
                              ? widget.favoriteViewModel
                                  .removeProductFromWishList(
                                      productId: widget.product.id!)
                              : widget.favoriteViewModel.addProductToWishList(
                                  productId: widget.product.id!);
                        },
                        icon: Icon(
                          widget.favoriteViewModel
                                  .isProductInWishList(widget.product.id!)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          //todo: change color
                          color: ColorManager.primary,
                          size: 35.0,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            //todo: product desc
            widget.product.description ?? '',
            maxLines: 3,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: ColorManager.textColor,
            ),
            overflow: TextOverflow.ellipsis,
            selectionColor: Colors.transparent,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            //todo: price
            'EGP ${widget.product.price.toString()}',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: ColorManager.textColor,
            ),
            overflow: TextOverflow.ellipsis,
            selectionColor: Colors.transparent,
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              Text(
                //todo: rating average
                'Review (${widget.product.ratingsAverage.toString()})',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.textColor,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              const Icon(
                Icons.star,
                color: ColorManager.yellow,
              ),
              SizedBox(
                width: 30.w,
              ),
              BlocListener<CartViewModel, CartStates>(
                bloc: widget.cartViewModel,
                listener: (context, state) async {
                  if (state is AddToCartLoadingState) {
                    // CustomDialog.showLoading(context);
                    CustomDialog.showMessage('loading..');
                  }
                  if (state is AddToCartSuccessState) {
                    // CustomDialog.hideLoading(context);

                    // todo : show message
                    CustomDialog.showMessage(
                      state.message,
                    );
                  } else if (state is AddToCartErrorState) {
                    // CustomDialog.hideLoading(context);
                    // todo : show message
                    // CustomDialog.showMessage(
                    //   state.errMsg,
                    // );
                  }
                },
                child: InkWell(
                  onTap: () {
                    widget.cartViewModel
                        .addToCart(productId: widget.product.id ?? '');
                  },
                  child: Icon(
                    //todo: change to add icon to the cart
                    Icons.add_circle_outline_sharp,
                    color: ColorManager.primary,
                    size: 27.w,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
